class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation
	has_many :group, :through => :groupmember
	has_many :bill, :through => :billparticipant
	
	#Validations
	validates :name, :presence => true
	
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, :presence => true,
                    :format   => { :with => email_regex },
					:uniqueness => true
					
	validates :password, :confirmation => true,
						:presence => true
						
	def self.authenticate (email, password)
		user = User.find_by_email(email)
		return nil if user.nil?
		if (user.correctPassword(password)) then return user end
	end
	
	def correctPassword(sub_pass)
		if (sub_pass == password) then
			return true
		else
			return false
		end
	end
end
