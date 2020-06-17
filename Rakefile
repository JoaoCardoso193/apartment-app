ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc 'Enter a console'
task :console do
  Pry.start
end
# Type `rake -T` on your command line to see the available rake tasks.
