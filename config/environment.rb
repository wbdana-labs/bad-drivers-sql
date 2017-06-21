require 'bundler'
require 'sqlite3'
Bundler.require



# ActiveRecord::Base.establish_connection({adapter: 'sqlite3', database: './bad_drivers.db'})

DB = {:conn => SQLite3::Database.new("./bad_drivers.db")}
