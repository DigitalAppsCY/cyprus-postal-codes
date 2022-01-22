# frozen_string_literal: true

require_relative "lib/cyprus_postal_codes/version"

Gem::Specification.new do |spec|
  spec.name = "cyprus-postal-codes"
  spec.version = CyprusPostalCodes::VERSION
  spec.authors = ["Evangelos Giataganas"]
  spec.email = ["e.giataganas@gmail.com"]

  spec.summary       = "A gem for using the CyprusPost: Postal Codes API"
  spec.description   = "A gem for using the CyprusPost: Postal Codes API (https://documenter.getpostman.com/view/6477303/RztmtUjG)"
  spec.homepage      = "https://github.com/EGiataganas/cyprus-postal-codes"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/EGiataganas/cyprus-postal-codes"
  spec.metadata["changelog_uri"] = "https://github.com/EGiataganas/cyprus-postal-codes/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 1.9"
  spec.add_dependency "faraday_middleware", "~> 1.2"
end
