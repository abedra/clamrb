require 'rake/testtask'
require 'rake/clean'
require 'rbconfig'
require 'fileutils'

EXT = RbConfig::CONFIG['DLEXT']

file "lib/clamrb/clamrb.#{EXT}" => Dir.glob('ext/clamrb/*.c') do
  Dir.chdir('ext/clamrb') do
    ruby "extconf.rb"
    sh "make"
  end
  FileUtils.mkdir_p('lib/clamrb')
  cp "ext/clamrb/clamrb.#{EXT}", "lib/clamrb/clamrb.#{EXT}"
end

task :test => "lib/clamrb/clamrb.#{EXT}"

CLEAN.include("ext/**/*{.o,.log,.#{EXT}")
CLEAN.include('ext/**/Makefile')
CLEAN.include("lib/**/*.#{EXT}")

Rake::TestTask.new do |t|
  t.libs << 'test'
end

task :default => :test
