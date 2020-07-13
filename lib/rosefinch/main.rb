require "rack"

module RoseFinch
  class Base
    def initialize
      @routes = {}
    end

    attr_reader :routes

    def get(path, &handler)
      route("GET", path, &handler)
    end

    def post(path, &handler)
      route("POST", path, &handler)
    end

    def put(path, &handler)
      route("PUT", path, &handler)
    end

    def patch(path, &handler)
      route("PATCH", path, &handler)
    end

    def delete(path, &handler)
      route("DELETE", path, &handler)
    end

    def head(path, &handler)
      route("HEAD", path, &handler)
    end

    def call(env)
      @request = Rack::Request.new(env)
      verb = @request.request_method
      requested_path = @request.path_info

      handler = @routes.fetch(verb, {}).fetch(requested_path, nil)

      if handler
        result = instance_eval(&handler)
        if result.class == String
          [200, {}, [result]]
        else
          result
        end
      else
        [404, {}, ["404 Not Found! No Route: #{verb} #{requested_path}"]]
      end
    end

    attr_reader :request

    private

    def route(verb, path, &handler)
      @routes[verb] ||= {}
      @routes[verb][path] = handler
    end

    def params
      @request.params
    end
  end

  BaseApp = Base.new

  def self.RunServer(port: 4567)
    Rack::Handler::WEBrick.run RoseFinch::BaseApp, Port: port
  end

  module Delegator
    def self.delegate(baseApp,*methods)
      Array(methods).each do |method_name|
        define_method(method_name) do |*args, &block|
            baseApp.send(method_name, *args, &block)
        end

        private method_name
      end
    end

    delegate BaseApp, :get,:post, :patch, :put, :delete, :head
  end
end


# To avoid affecting Object inheritance, bind to the main Object
extend RoseFinch::Delegator