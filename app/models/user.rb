class User < ActiveRecord::Base
	has_secure_password

	validates :username, presence: true
	validates :email, presence: true

	validates_uniqueness_of :username, :case_sensitive => false
	validates_uniqueness_of :email, :case_sensitive => false
end
