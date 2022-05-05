class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :persons
      t.integer :total_price

      t.timestamps
    end
  end
end
