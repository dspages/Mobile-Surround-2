class User < ApplicationRecord

  validates :username, :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :username, length: { minimum: 2, maximum: 20 }

  has_one :sound_group_led,
    primary_key: :id,
    foreign_key: :leader_id,
    class_name: :SoundGroup

  after_initialize :ensure_session_token

  attr_reader :password

# exists for testing paper clip  "/images/:style/missing.png"
  # has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing.png"
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
#  remove once out of dev.
  def self.find_by_credentials(username, pw)
    usr = User.find_by_username(username)
    return usr if usr && usr.is_password?(pw)
    nil
  end

  def is_password?(pw)
    digest = BCrypt::Password.new(self.password_digest)
    digest.is_password?(pw)
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

end
