class Account <  ActiveRecord::Base

  belongs_to :customer
  belongs_to :bank


  def self.total_accounts
    Account.all.count
  end



end

