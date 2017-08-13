class Track < ApplicationRecord

  validates :name, length: { minimum: 1, maximum: 20 }

  has_many :sound_groups,
    primary_key: :id,
    foreign_key: :track_id,
    class_name: :SoundGroup

end
