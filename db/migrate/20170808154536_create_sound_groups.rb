class CreateSoundGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :sound_groups do |t|
      t.string :name
      t.integer :track_id
      t.timestamps
    end
  end
end
