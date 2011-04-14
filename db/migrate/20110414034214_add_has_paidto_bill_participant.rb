class AddHasPaidtoBillParticipant < ActiveRecord::Migration
  def self.up
	  add_column :billparticipants, :has_paid, :boolean
  end

  def self.down
  end
end
