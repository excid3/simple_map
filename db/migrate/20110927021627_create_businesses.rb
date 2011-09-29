class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.text :description
      t.string :website
      t.string :twitter
      t.string :email
      t.boolean :approved, :default => false
      t.string :lat
      t.string :lng
      t.boolean :gmaps
      t.user_id :integer

      t.timestamps
    end
  end
end
