require 'bundler/setup'
require 'pry'
Bundler.require

require_all 'app'

ENV['SINATRA_ENV'] ||= "development"

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/nyc#{ENV['SINATRA_ENV']}.sqlite"
)

