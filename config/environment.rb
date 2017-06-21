require 'bundler'
require 'sqlite3'
Bundler.require
require 'active_record'



ActiveRecord::Base.establish_connection({adapter: 'sqlite3', database: './bad_drivers.db'})

require_all './'

DB = {:conn => SQLite3::Database.new("./bad_drivers.db")}
