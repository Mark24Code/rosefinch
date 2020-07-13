require_relative "../lib/rosefinch/main.rb"

get "/" do
  "Hello World!"
end

get "/welcome" do
    "welcome rosefinch!"
end


RoseFinch::RunServer port:9000