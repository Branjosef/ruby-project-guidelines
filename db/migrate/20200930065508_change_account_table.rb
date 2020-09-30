class ChangeAccountTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :accounts, :type, :bank_account
  end
end
