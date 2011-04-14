class AddUserIDtoParticipant < ActiveRecord::Migration
  def self.up
      add_column :billparticipants, :user_id, :integer

  end

  def self.down
  end
end
