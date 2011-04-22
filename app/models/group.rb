class Group < ActiveRecord::Base
	has_many :user, :through => :groupmember
	
	def addUser(uid)
		@groupmember = Groupmember.new
		@groupmember.group_id = self.id
		@groupmember.user_id = uid
		@groupmember.save
	end
	
	def removeUser(uid)
		@groupmembers = Groupmember.where("group_id = ? AND user_id = ?",
			self.id, uid)
		@groupmembers.each do |member|
			member.destroy
		end
	end
end
