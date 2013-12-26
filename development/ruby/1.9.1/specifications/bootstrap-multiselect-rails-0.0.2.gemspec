# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "bootstrap-multiselect-rails"
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Benjamin Canac"]
  s.date = "2013-07-19"
  s.description = "Add Bootstrap Multiselect to your rails app. See https://github.com/davidstutz/bootstrap-multiselect for more information about bootstrap-multiselect."
  s.email = ["canacb1@gmail.com"]
  s.homepage = "https://github.com/benjamincanac/bootstrap-multiselect-rails"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Add Bootstrap Multiselect to your rails app."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.2.13"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.2.13"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.2.13"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end
