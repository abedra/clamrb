require 'bundler/gem_tasks'
require 'rake/extensiontask'
require 'rake/testtask'
require 'rake/clean'
require 'rbconfig'
require 'fileutils'

Rake::ExtensionTask.new("clamrb") do |extension|
  extension.lib_dir = 'lib/clamrb'
end

task :build => [:clean, :compile]

Rake::TestTask.new(:test => :build) do |t|
  t.test_files = Dir['**/*_test.rb'].reject do |path|
    path.include?('vendor')
  end
end

task :default => :test
