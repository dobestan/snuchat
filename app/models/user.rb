class User < ActiveRecord::Base
  before_save { self.mysnu = mysnu.downcase }
  before_create :create_remember_token
  before_create :create_activation_token

  validates :name, presence: true,
                   length: { maximum: 20 },
                   uniqueness: { case_sensitive: false }
  validates :mysnu, presence: true,
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password_digest, presence: true

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_activation_token
      self.activation_token = User.encrypt(User.new_remember_token)
    end

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
