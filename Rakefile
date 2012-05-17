#!/usr/bin/env rake
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = FileList['files/default/test/**/*_spec.rb']
  t.verbose = true
end

task :default => 'test'
