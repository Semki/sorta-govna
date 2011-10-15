class AddCreateByGuestFlagToShit < ActiveRecord::Migration
  def change
    add_column :shits, :created_by_guest, :boolean, :default=>false
  end
end
