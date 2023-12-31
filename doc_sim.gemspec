# frozen_string_literal: true

require_relative "lib/doc_sim/version"

Gem::Specification.new do |spec|
  spec.name = "doc_sim"
  spec.version = DocumentSimilarity::VERSION
  spec.authors = ["Forthoney"]
  spec.email = ["castlehoneyjung@gmail.com"]

  spec.summary = "Calculating approximate document similarity with" \
                 "locality sensitive hashing algorithm " \
                 "using Minhash signatures"
  # spec.description = "LO"
  spec.homepage = "https://github.com/Forthoney/doc_sim"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Forthoney/doc_sim"
  spec.metadata["changelog_uri"] = "https://github.com/Forthoney/doc_sim/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "murmurhash3", "~> 0.1.7"

  spec.add_development_dependency "rspec", "~> 3.12"
  spec.add_development_dependency "rubocop", "~> 1.56"
  spec.add_development_dependency "steep", "~> 1.5.3"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
