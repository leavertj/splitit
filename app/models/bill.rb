class Bill < ActiveRecord::Base
	has_many :user, :through => :billparticipant
	validates :amount, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }
end
