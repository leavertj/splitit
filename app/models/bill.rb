class Bill < ActiveRecord::Base
  has_many :user, :through => :billparticipants
  has_many :billparticipants

  #Bill validations
  validates :amount, :presence => true, :format => { :with => /^\d+?(?:\.\d{0,2})?$/ }
  validates :title, :presence => true

  def add_participant(uid, gid, shareIn)
    billparticipants.create(uid, gid, shareIn)
  end

  def remove_participant(uid)
    @bilpars = Groupmember.where("user_id = ?", uid)
    billparticipants.delete(@billpars)
  end
end
	

