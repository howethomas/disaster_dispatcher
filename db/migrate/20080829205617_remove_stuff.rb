class RemoveStuff < ActiveRecord::Migration
  def self.up
    drop_table :apps
    drop_table :schedules
    drop_table :accounts
    drop_table :groups
    drop_table :contacts_groups
    drop_table :contacts_schedules
    drop_table :groups_schedules
    drop_table :runners
    drop_table :models
    drop_table :tasks
    drop_table :utilities
  end

  def self.down
  end
end
