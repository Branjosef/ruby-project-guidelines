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

def accounts
  accounts_data = []
  Account.all.select do |a|
    if a.customer_id == self.id
      accounts_data << a 
    end
  end
  accounts_data
  account_info = []
  account_summary = []
    accounts_data.each do |e|
     x = Bank.find(e.bank_id)
       account_info << x.name
       account_info << x.location
       account_info << e.bank_account
       account_info << e.balance
    end
    p account_info
    # accounts_final = []
    # account_info.each do |e|
    # accounts_final << "Financial Instution: #{e[0]}, location: #{e[1]}, Balanace: $#{e[2]}"
    # end
    # accounts_final.each {|e| p e}
  end


end