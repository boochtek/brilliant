# encoding: utf-8

require "rake/clean"
require "cucumber/rake/task"

task :default => :test

desc "Run all tests"
task :test => [:cucumber]

Cucumber::Rake::Task.new(:cucumber => :compiler)

desc "Compiler"
task :compiler => ["src/brilliant/parser.rb"]

file "src/brilliant/parser.rb" => ["src/brilliant/parser.rtlr"] do |task|
  sh "rtlr #{task.prerequisites.first} -d #{File.dirname(task.name)} -o #{File.basename(task.name)} --force"
end
