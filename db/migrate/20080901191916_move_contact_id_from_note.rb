class MoveContactIdFromNote < ActiveRecord::Migration
  def self.up
    rename_column :notes, :contact_id, :user_id
  end

  def self.down
  end
end
