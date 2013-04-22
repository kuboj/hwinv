class RenameTypeColumn < ActiveRecord::Migration
  def change
    rename_column :hardware_types, :type, :name
  end
end
