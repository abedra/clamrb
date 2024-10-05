lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "clamrb/version"

Gem::Specification.new do |s|
  s.name          = 'clamrb'
  s.version       = Clamrb::VERSION
  s.date          = '2024-10-04'
  s.licenses      = ['MIT']
  s.summary       = 'Ruby interface to Clam AV'
  s.description   = 'Native Ruby extension for running clamav scans'
  s.authors       = ['Aaron Bedra']
  s.email         = 'aaron@aaronbedra.com'
  s.extensions    = ['ext/clamrb/extconf.rb']
  s.homepage      = 'https://github.com/abedra/clamrb'
  s.require_paths = ["lib"]
  s.files         = %x{git ls-files}.split("\n").reject {|file| file =~ /^(test)/ }
  s.test_files    = %x{git ls-files}.split("\n").select {|file| file =~ /^(test)/ }
  s.add_dependency "rake-compiler", "~> 1.0"
  s.add_development_dependency "bundler", "~> 2.5"
  s.add_development_dependency "rake", "~> 12.3.3"
  s.add_development_dependency "test-unit", "~> 3.2"
end
