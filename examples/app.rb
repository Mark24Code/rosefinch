require "rosefinch"

get "/" do
  "Hello World!"
end

get "/welcome" do
    "welcome rosefinch!"
end


RoseFinch::RunServer port:4567