class CreateHardwareTypes < ActiveRecord::Migration
  def change
    create_table :hardware_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
