class CreateBillparticipants < ActiveRecord::Migration
  def self.up
    create_table :billparticipants do |t|
      t.decimal :share

      t.timestamps
    end
  end

  def self.down
    drop_table :billparticipants
  end
end
