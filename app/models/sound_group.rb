class SoundGroup < ApplicationRecord
  belongs_to :Leader,
    primary_key: :id,
    foreign_key: :leader_id,
    class_name: :User,
    dependent: :destroy

  has_many :Users,
    primary_key: :id,
    foreign_key: :sound_group_id,
    class_name: :User

  belongs_to :Track,
    primary_key: :id,
    foreign_key: :track_id,
    class_name: :Track
end
