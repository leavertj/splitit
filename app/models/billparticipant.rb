class Billparticipant < ActiveRecord::Base
	belongs_to :bill, :foreign_key => "bill_id"
	belongs_to :user, :foreign_key => "user_id"
end
