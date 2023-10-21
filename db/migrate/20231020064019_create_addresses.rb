class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string  :departure
      t.string  :destination_1
      t.string  :destination_2
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end




