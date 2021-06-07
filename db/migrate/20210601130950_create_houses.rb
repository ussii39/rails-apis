class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.string :housename
      t.string :address
      t.integer :house_status
      t.belongs_to :users
      t.timestamps
    end
  end
end
