class User < ApplicationRecord
  before_validation :normalize_email

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    @normalized_email = email.strip.downcase
    user = User.find_by_email(@normalized_email)

    if user && user.authenticate(password)
      user
    else
      nil
    end
    
  end

  private

  def normalize_email
    self.email = email.strip.downcase if email.present?
  end

end
