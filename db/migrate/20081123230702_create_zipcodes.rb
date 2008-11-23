class CreateZipcodes < ActiveRecord::Migration
  def self.up
    create_table :zipcodes do |t|
      t.integer :zipcode
      t.float :latitude
      t.float :longitude
      t.string :state
      t.string :city
      t.string :county
    end
  end

  def self.down
    drop_table :zipcodes
  end
end
