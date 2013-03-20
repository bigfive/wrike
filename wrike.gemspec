# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{wrike}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matt Scifo"]
  s.date = %q{2013-03-20}
  s.description = %q{wrike is a Ruby client for the Wrike API using OAuth.}
  s.email = %q{matt@scifo.info}
  s.files = ["LICENSE", "README.md","lib/wrike.rb"] + Dir.glob('lib/wrike/*.rb')
  s.has_rdoc = false
  s.homepage = %q{http://github.com/mscifo/wrike}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{wrike}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{wrike is a Ruby client for the Wrike API using OAuth.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oauth>, [">= 0.4.1"])
      s.add_runtime_dependency(%q<json>, [">= 1.1.9"])
      s.add_runtime_dependency(%q<mime-types>, [">= 1.16"])
      %w(shoulda mocha).each do |dep|
        s.add_development_dependency dep
      end
    else
      s.add_dependency(%q<oauth>, [">= 0.4.1"])
      s.add_dependency(%q<json>, [">= 1.1.9"])
      s.add_dependency(%q<mime-types>, [">= 1.16"])
    end
  else
    s.add_dependency(%q<oauth>, [">= 0.4.1"])
    s.add_dependency(%q<json>, [">= 1.1.9"])
    s.add_dependency(%q<mime-types>, [">= 1.16"])
  end
end
