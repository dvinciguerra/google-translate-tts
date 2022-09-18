# frozen_string_literal: true

require 'bundler/gem_tasks'

# rspec
begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
  warn 'Need to install rspec: $ gem install rspec'
end

# rubocop
begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError
  warn 'Need to install rubocop: $ gem install rubocop rubocop-rspec'
end

task default: %i[spec rubocop]
