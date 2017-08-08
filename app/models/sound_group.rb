class SoundGroup < ApplicationRecord
  belongs_to :leader,
    primary_key: :id,
    foreign_key: :leader_id,
    class_name: :User,
    dependent: :destroy

  has_many :users,
    primary_key: :id,
    foreign_key: :sound_group_id,
    class_name: :User

  belongs_to :track,
    primary_key: :id,
    foreign_key: :track_id,
    class_name: :Track
end
