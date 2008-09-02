class AddScreenToContact < ActiveRecord::Migration
  def self.up
    add_column :contacts, :screen_name, :string
  end

  def self.down
  end
end
