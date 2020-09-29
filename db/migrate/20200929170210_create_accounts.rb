class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :type
      t.integer :balance
      t.integer :bank_id
      t.integer :customer_id
      t.timestamps
    end
  end
end



