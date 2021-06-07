class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
        t.string :name
        t.string :address
        t.belongs_to :users
        t.timestamps
    end
  end
end