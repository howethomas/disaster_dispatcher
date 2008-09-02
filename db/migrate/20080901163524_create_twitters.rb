class CreateTwitters < ActiveRecord::Migration
  def self.up
    create_table :twitters do |t|
      t.string :screen_name
      t.string :password
      t.integer :contact_id

      t.timestamps
    end
  end

  def self.down
    drop_table :twitters
  end
end
