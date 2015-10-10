class User < ActiveRecord::Base
	has_secure_password

	validates :username, presence: true
	validates :email, presence: true

	validates_uniqueness_of :username, :case_sensitive => false
	validates_uniqueness_of :email, :case_sensitive => false

	has_many :chats, :foreign_key => :sender_id

	def self.allExcept(search, user_id)
		if search.length > 0
			where("(username like :search OR email like :search) AND id is not :user_id", :search => "%#{search}%", :user_id => user_id)
		else
			nil
		end
	end
end
