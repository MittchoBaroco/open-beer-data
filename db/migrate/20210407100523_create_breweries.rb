class CreateBreweries < ActiveRecord::Migration[6.1]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :country_code
      t.string :registery_number
      t.string :external_id
      t.boolean :active
      t.string :creation_year
      t.string :state
      t.string :city
      t.string :street
      t.string :postal_code
      t.string :size

      t.timestamps
    end
  end
end
