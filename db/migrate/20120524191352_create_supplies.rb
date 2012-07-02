class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :name
      t.string :amount
      t.integer :category_id
      t.integer :party_id
      t.integer :user_id

      t.timestamps
    end
  end
end
