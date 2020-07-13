Gem::Specification.new do |s|
    s.name        = 'rosefinch'
    s.version     = '0.0.2'
    s.date        = '2020-07-13'
    s.summary     = "Sinatra like framework"
    s.description = "[Experimenting!] Classy Web framework like sinatra.Small, beautiful and easy to use."
    s.authors     = ["Mark24"]
    s.email       = "mark.zhangyoung@qq.com"
    s.files       = Dir["lib/**/*"]+Dir["examples/**/*"]+
    [
        "Gemfile",
        "LICENSE",
        "rosefinch.gemspec"
    ]
    s.metadata    = { "source_code_uri" => "https://github.com/Mark24Code/rosefinch" }
    s.homepage    =
      'https://github.com/Mark24Code/rosefinch'
    s.license       = 'MIT'
  end
  