class RenameTwitter < ActiveRecord::Migration
  def self.up
    rename_table :twitters, :twit
  end

  def self.down
  end
end
