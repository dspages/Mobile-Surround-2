class Track < ApplicationRecord

  has_many :SoundGroups,
    primary_key: :id,
    foreign_key: :track_id,
    class_name: :SoundGroup

  
end
