require "bundler/gem_tasks"
require "rake/testtask"
require 'cucumber'
require 'cucumber/rake/task'

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task :default => :features

desc 'Features can be specified as extra arguments'
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = [
      "--no-color",
      "--format progress -o log/features.log",
      "--format junit    -o log/",
      "--format html     -o log/features.html",
      "--format pretty"]
end