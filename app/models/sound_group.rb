class SoundGroup < ApplicationRecord

  validates :name, length: { minimum: 2, maximum: 20 }

  belongs_to :leader,
    primary_key: :id,
    foreign_key: :leader_id,
    class_name: :User,
    dependent: :destroy

  has_many :users,
    primary_key: :id,
    foreign_key: :sound_group_id,
    class_name: :User

end
