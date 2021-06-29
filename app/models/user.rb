class User < ActiveRecord::Base

  has_secure_password
  validates :password, length: { minimum: 3 }
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_uniqueness_of :email, :case_sensitive => false

  def self.authenticate_with_credentials(email, password)
    return nil if email == nil
    @user = User.find_by_email(email.strip.downcase)
    @user && @user.authenticate(password)

  end

end
