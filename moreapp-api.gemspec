# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: moreapp-api 0.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "moreapp-api".freeze
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["'nathanvda'".freeze]
  s.date = "2021-01-29"
  s.description = "This gem allows you to connect to the moreapp API to send instructions and retrieve the registrations".freeze
  s.email = "'nathan@dixis.com'".freeze
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    "CODE_OF_CONDUCT.md",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "examples/config.rb.example",
    "examples/test_moreapp_api.rb",
    "examples/test_post_instruction_to_form.rb",
    "lib/moreapp_api.rb",
    "lib/moreapp_api/customer.rb",
    "lib/moreapp_api/folder.rb",
    "lib/moreapp_api/form.rb",
    "lib/moreapp_api/registration_file.rb",
    "lib/moreapp_api/submission.rb",
    "moreapp-api.gemspec",
    "spec/moreapp_api_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/nathanvda/moreapp-api".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.14.1".freeze
  s.summary = "A simple gem to use the moreapp API".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oauth>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5.0"])
      s.add_development_dependency(%q<shoulda>.freeze, [">= 0"])
      s.add_development_dependency(%q<rdoc>.freeze, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>.freeze, ["> 1.0"])
      s.add_development_dependency(%q<juwelier>.freeze, ["~> 2.1.0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
    else
      s.add_dependency(%q<oauth>.freeze, [">= 0"])
      s.add_dependency(%q<json>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.5.0"])
      s.add_dependency(%q<shoulda>.freeze, [">= 0"])
      s.add_dependency(%q<rdoc>.freeze, ["~> 3.12"])
      s.add_dependency(%q<bundler>.freeze, ["> 1.0"])
      s.add_dependency(%q<juwelier>.freeze, ["~> 2.1.0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<oauth>.freeze, [">= 0"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.5.0"])
    s.add_dependency(%q<shoulda>.freeze, [">= 0"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 3.12"])
    s.add_dependency(%q<bundler>.freeze, ["> 1.0"])
    s.add_dependency(%q<juwelier>.freeze, ["~> 2.1.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end

