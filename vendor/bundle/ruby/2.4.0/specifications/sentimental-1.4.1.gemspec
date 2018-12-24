# -*- encoding: utf-8 -*-
# stub: sentimental 1.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "sentimental".freeze
  s.version = "1.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jeff Emminger".freeze, "Christopher MacLellan".freeze, "Denis Pasin".freeze]
  s.date = "2016-12-26"
  s.description = "A simple sentiment analysis gem".freeze
  s.email = ["jeff@7compass.com".freeze, "denis@hellojam.fr".freeze]
  s.homepage = "https://github.com/7compass/sentimental".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Simple sentiment analysis".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 3.0.0"])
      s.add_development_dependency(%q<rubocop>.freeze, [">= 0.40.0", "~> 0.40"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 3.0.0"])
      s.add_dependency(%q<rubocop>.freeze, [">= 0.40.0", "~> 0.40"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 3.0.0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0.40.0", "~> 0.40"])
  end
end
