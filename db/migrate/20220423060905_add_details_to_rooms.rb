class AddDetailsToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :address, :string
    add_column :rooms, :price, :integer
  end
end
