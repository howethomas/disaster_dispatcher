class CleanUpOptions < ActiveRecord::Migration
  def self.up
    drop_table :broadworks
    drop_table :twits
  end

  def self.down
  end
end
