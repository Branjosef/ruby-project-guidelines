class Account <  ActiveRecord::Base

  belongs_to :customer
  belongs_to :bank


  def self.total_accounts
    Account.all.count
  end



  def self.new_account(type, balance, bank_id, customer_id)
    Account.create(bank_account: type, balance: balance.to_f, bank_id: bank_id.to_i , customer_id: customer_id.to_i)
  end

  

  


end

