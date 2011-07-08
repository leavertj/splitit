class Group < ActiveRecord::Base
  has_many :user, :through => :groupmembers
  has_many :groupmembers

  def addMember(uid)
    groupmembers.create(:user_id => uid, :group_id => id)
  end

  def removeMember(uid)
    @groupmembers = groupmembers.where("group_id = ? AND user_id = ?",
                                       id, uid)
    groupmembers.delete(@groupmembers)
  end
end

