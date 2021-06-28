class User < ActiveRecord::Base

  has_secure_password
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
end
