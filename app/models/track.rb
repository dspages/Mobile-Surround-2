class Track < ApplicationRecord

  has_many :sound_groups,
    primary_key: :id,
    foreign_key: :track_id,
    class_name: :SoundGroup


end
