class ChangeTotalColumn < ActiveRecord::Migration
  def up
    change_column_default :shits, :total, 0
  end

  def down
    change_column_default :shits, :total, nil
  end
end
