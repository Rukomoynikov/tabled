Gem::Specification.new do |s|
  s.name        = 'tabled'
  s.version     = '0.0.2'
  s.summary     = "Library for rendering pretty tables in console"
  s.description = "This library can be used to render your data to a console. It's quite simple and has many features"
  s.authors     = ["Max Rukomoynikov"]
  s.email       = 'rukomoynikov@gmail.com'
  s.files =
    Dir.chdir(File.expand_path(__dir__)) do
      `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
    end
  s.homepage    = 'https://rubygems.org/gems/tabled'
  s.metadata    = { "source_code_uri" => "https://github.com/Rukomoynikov/tabled" }
  s.license       = 'MIT'

  s.add_development_dependency "byebug"
  s.add_development_dependency "rspec"
  s.add_development_dependency "simplecov"
end