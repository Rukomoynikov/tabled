# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'tabled'
  s.version     = '1.2.1'
  s.summary     = 'Library for rendering pretty tables in console'
  s.description = 'Library can be used to render your data to a console. Being quite simple it has many features.'
  s.authors     = ['Max Rukomoynikov']
  s.email       = 'rukomoynikov@gmail.com'
  s.executables << 'tabled'
  s.files =
    Dir.chdir(File.expand_path(__dir__)) do
      `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
    end
  s.homepage    = 'https://rubygems.org/gems/tabled'
  s.metadata    = { 'source_code_uri' => 'https://github.com/Rukomoynikov/tabled',
                    'rubygems_mfa_required' => 'true' }
  s.license = 'MIT'

  s.required_ruby_version = '>= 2.7.0'

  s.add_dependency 'dry-cli' # For CLI ap
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-rspec'
  s.add_development_dependency 'simplecov'
end
