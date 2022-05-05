class AddDetailsToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :room_id, :integer
  end
end
