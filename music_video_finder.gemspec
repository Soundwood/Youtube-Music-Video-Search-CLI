require_relative 'lib/version'

Gem::Specification.new do |spec|
  spec.name          = "music_video_finder"
  spec.version       = MusicVideoFinder::VERSION
  spec.authors       = ["Soundwood"]
  spec.email         = ["j.benhogan@gmail.com"]

  spec.summary       = %q{Uses YouTube API to return information for user}
  spec.description   = %q{Longer description of YouTube API Search CLI Program}
  spec.homepage      = "https://github.com/Soundwood/flatiron-cli-project-youtube-search"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = 'http://mygemserver.com'

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Soundwood/flatiron-cli-project-youtube-search"
  spec.metadata["changelog_uri"] = "https://github.com/Soundwood/flatiron-cli-project-youtube-search"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
