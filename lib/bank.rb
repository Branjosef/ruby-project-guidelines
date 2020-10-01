class Bank < ActiveRecord::Base

has_many :accounts
has_many :customers, through: :accounts


def self.total_banks
  Bank.all.count
end

def self.Bank_id
   Bank.all.map {|b| [b.id, b.name]}
end

def self.find_id(name)
  x = Bank.find_by(name: name)
  p x.id
end

def self.create_new(name, location)
  self.create(name: name.downcase, location: location.downcase)
end

end





