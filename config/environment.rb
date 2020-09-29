require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_relative '../lib/account'
require_relative '../lib/bank.rb'
require_relative '../lib/customer.rb'
