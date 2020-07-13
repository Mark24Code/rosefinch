# rosefinch

sinatra like framework


## Intro

```ruby

require "rosefinch"

get "/" do
  "Hello World!"
end


RoseFinch::RunServer port:4567
```

supprt  `:get,:post, :patch, :put, :delete, :head`