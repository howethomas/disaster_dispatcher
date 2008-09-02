class RenameTwitters < ActiveRecord::Migration
  def self.up
    rename_table :twit, :twits
  end

  def self.down
  end
end
