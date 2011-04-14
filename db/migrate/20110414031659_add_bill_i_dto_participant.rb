class AddBillIDtoParticipant < ActiveRecord::Migration
  def self.up
	add_column :billparticipants, :bill_id, :integer
  end

  def self.down
  end
end
