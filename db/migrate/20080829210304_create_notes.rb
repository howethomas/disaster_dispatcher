class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.string :text
      t.integer :contact_id
      t.boolean :public_note

      t.timestamps 
    end
  end

  def self.down
    drop_table :notes
  end
end