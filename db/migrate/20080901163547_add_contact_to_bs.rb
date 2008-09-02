class AddContactToBs < ActiveRecord::Migration
  def self.up
    add_column :Broadworks, :contact_id, :integer
  end

  def self.down
  end
end
