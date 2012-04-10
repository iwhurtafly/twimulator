# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rails_legacy_mapper"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew White"]
  s.date = "2011-03-29"
  s.description = "This gem provides an extraction of the DeprecatedMapper from Rails 3.0.\nIf you have a legacy application with an old style routes.rb file this\nallows you to get your application running quickly in Rails 3.1.\n"
  s.email = ["andyw@pixeltrix.co.uk"]
  s.homepage = "https://github.com/pixeltrix/rails_legacy_mapper/"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Old style routes for Rails 3.1"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.1.0.beta"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.10"])
      s.add_development_dependency(%q<mocha>, ["~> 0.9.8"])
      s.add_development_dependency(%q<rake>, ["~> 0.8.7"])
    else
      s.add_dependency(%q<rails>, ["~> 3.1.0.beta"])
      s.add_dependency(%q<bundler>, ["~> 1.0.10"])
      s.add_dependency(%q<mocha>, ["~> 0.9.8"])
      s.add_dependency(%q<rake>, ["~> 0.8.7"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.1.0.beta"])
    s.add_dependency(%q<bundler>, ["~> 1.0.10"])
    s.add_dependency(%q<mocha>, ["~> 0.9.8"])
    s.add_dependency(%q<rake>, ["~> 0.8.7"])
  end
end
