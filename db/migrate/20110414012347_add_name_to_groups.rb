class AddNameToGroups < ActiveRecord::Migration
  def self.up
    add_column :groups, :name, :string
  end

  def self.down
    remove_column :groups, :name
  end
end
