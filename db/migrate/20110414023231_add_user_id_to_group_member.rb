class AddUserIdToGroupMember < ActiveRecord::Migration
  def self.up
	add_column :bills, :user_id, :integer
	add_column :bills, :group_id, :integer
  end

  def self.down
    remove_column :groupmembers, :user_id
  end
end
