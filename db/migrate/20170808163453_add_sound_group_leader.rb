class AddSoundGroupLeader < ActiveRecord::Migration[5.0]
  def change
    add_column :sound_groups, :leader_id, :integer
  end
end
