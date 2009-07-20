class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :user_id_giving, :null => false
      t.integer :user_id_receiving, :null => false
      t.integer :post_id
      t.string :description, :limit => 140, :null => false
      t.string :state
      t.integer :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
