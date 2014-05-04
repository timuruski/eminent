desc "Start development console"
task :console => [:env] do
  require 'irb'
  require 'irb/completion'

  ARGV.clear
  IRB.start
end

namespace :db do
  desc "Setup database"
  task :setup => [:env] do
    Eminent::Database.setup
  end
end

task :env do
  $LOAD_PATH.unshift File.expand_path('./lib')

  require 'bundler/setup'
  require 'eminent'
end
