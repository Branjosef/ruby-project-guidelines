class Customer < ActiveRecord::Base

has_many :accounts
has_many :banks, through: :accounts


def self.total_customers
  Customer.all.count
end

def new_account (bank, account_type, balance)
  create new account 
end

def self.wipe_all_customers
  puts "WARNING! THIS WILL REMOVE ALL CUSTOMER INFORMATION FROM THE DATABASE!!!"
  puts "Confirm delete request? (y/n)"
    # user_input = gets.chomp
    #  if user_input.downcase == "y"
    #   Customer.delete_all
    #   puts "All customer information has been deleted from the database"
    #  else
    #    puts "Deletion aborted"
    #    ##need to add redirect to back to customer home screen interface
    #  end
end   

end