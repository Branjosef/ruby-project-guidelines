class Customer < ActiveRecord::Base

has_many :accounts
has_many :banks, through: :accounts


def self.total_customers
  Customer.all.count
end


def self.new_customer (name, email, password)
  Customer.create(name: name.downcase, email: email.downcase, password: password.downcase)
end

def find_id
  x = Customer.find_by(name: self.name)
  x.id
end

end