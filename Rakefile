require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "yard"

RSpec::Core::RakeTask.new(:spec)
require "yard-tomdoc"

YARD::Rake::YardocTask.new

task :default => :spec
