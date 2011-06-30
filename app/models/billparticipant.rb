class Billparticipant < ActiveRecord::Base
	belongs_to :bill, :foreign_key => "bill_id", :dependent => :delete
	belongs_to :user, :foreign_key => "user_id"
	def setShare(amount)
		self.share = amount
	end
end
