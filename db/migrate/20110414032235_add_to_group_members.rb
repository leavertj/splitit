class AddToGroupMembers < ActiveRecord::Migration
  def self.up
  add_column :groupmembers, :group_id, :integer
  add_column :groupmembers, :user_id, :integer
  end

  def self.down
  end
end
