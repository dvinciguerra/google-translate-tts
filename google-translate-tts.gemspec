# frozen_string_literal: true

require_relative "lib/google_translate_tts/version"

Gem::Specification.new do |spec|
  spec.name = "google-translate-tts"
  spec.version = GoogleTranslateTts::VERSION
  spec.authors = ["Daniel Vinciguerra"]
  spec.email = ["daniel.vinciguerra@bivee.com.br"]

  spec.summary = "Simple Google Translate text to speech"
  spec.description = "Simple Google Translate text to speech"
  spec.homepage = "https://github.com/dvinciguerra/google-translate-tts"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"

  spec.add_development_dependency "rubocop", "~> 1.21"
  spec.add_development_dependency "rubocop-rspec", "~> 2.11"
end
