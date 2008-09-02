class UpdateOptionsUserId < ActiveRecord::Migration
  def self.up
    add_column :options, :user_id, :integer
  end

  def self.down
  end
end
