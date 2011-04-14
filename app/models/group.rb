class Group < ActiveRecord::Base
	has_many :user, :through => :groupmember
end
