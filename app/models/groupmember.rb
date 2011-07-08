class Groupmember < ActiveRecord::Base
	belongs_to :group, :foreign_key => "group_id", :dependent => :delete
	belongs_to :user, :foreign_key => "user_id", :dependent => :delete
end
