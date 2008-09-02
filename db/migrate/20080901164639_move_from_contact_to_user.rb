class MoveFromContactToUser < ActiveRecord::Migration
  def self.up
    rename_column :twitters, :contact_id, :user_id
    rename_column :broadworks, :contact_id, :user_id
  end

  def self.down
  end
end
