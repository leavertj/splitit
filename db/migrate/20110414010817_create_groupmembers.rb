class CreateGroupmembers < ActiveRecord::Migration
  def self.up
    create_table :groupmembers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :groupmembers
  end
end
