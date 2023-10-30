class CreateSecondDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :second_destinations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end