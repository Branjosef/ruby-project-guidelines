require 'bundler'
require 'colorize'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: '../db/development.db')
ActiveRecord::Base.logger = nil

require_relative '../lib/account'
require_relative '../lib/bank.rb'
require_relative '../lib/customer.rb'
require_relative '../lib/cli.rb'
#require_all 'db'
