class Bill < ActiveRecord::Base
	has_many :user, :through => :billparticipant
	
	#Bill validations
	validates :amount, :presence => true, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }
	validates :title, :presence => true
	
	def add_participant(uid, gid, shareIn)
		@bilpar = billparticipant.new
		@bilpar.group_id = self.id
		@bilpar.user_id = uid
		@bilpar.setShare(shareIn)
		@bilpar.save
	end 
	
	def remove_participant(uid)
		@bilpars = Groupmember.where("user_id = ?", uid)
		@bilpars.each do |member|
			member.destroy
		end
	end
	
end
