# frozen_string_literal: true

require_relative 'lib/harmony/api/version'

Gem::Specification.new do |spec|
  spec.name          = 'harmony-api'
  spec.version       = Harmony::Api::VERSION
  spec.authors       = ['Sebastian Johnsson']
  spec.email         = ['sebastian.johnsson@gmail.com']

  spec.summary       = 'Harmony Ruby API Client'
  spec.description   = 'Harmony Ruby API Client'
  spec.homepage      = 'https://github.com/SebastianJ/harmony-ruby-api'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/SebastianJ/harmony-ruby-api'
  spec.metadata['changelog_uri'] = 'https://github.com/SebastianJ/harmony-ruby-api/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday_middleware'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'solargraph'
end
