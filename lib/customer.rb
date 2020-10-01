class Customer < ActiveRecord::Base

has_many :accounts
has_many :banks, through: :accounts


def self.total_customers
  Customer.all.count
end

def delete_customer
  x = self.find_id
  Customer.delete(x)
end

def self.new_customer (name, email, password)
  Customer.create(name: name.downcase, email: email.downcase, password: password.downcase)
end

def find_id
  x = Customer.find_by(name: self.name)
  x.id
end

def accounts
  account_data = []
  account_info = []
  Account.all.select do |a|
    if a.customer_id == self.id
      account_data << a
    end
  end
   account_data
    account_data.each do |e|
      x = Bank.find(e.bank_id)
         account_info <<  "id:#{e.id}, Financial Institution: #{x.name.upcase}, Location: #{x.location.upcase}, Account: #{e.bank_account.upcase}, Balance: $#{e.balance}"
    end
    account_info   
    account_info.each {|e| p e}
  end

end