class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.integer :user_id
      t.string :name
      t.string :location
      t.time :start
      t.time :end
      t.text :description
      t.string :dress
      t.date :date

      t.timestamps
    end
  end
end
