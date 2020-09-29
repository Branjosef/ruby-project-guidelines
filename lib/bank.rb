class Bank < ActiveRecord::Base

has_many :accounts
has_many :customers, through: :accounts


def self.total_banks
  Bank.all.count
end


end





