class UpdateOptionsAgain < ActiveRecord::Migration
  def self.up
    add_column :options, :bw_user, :string
    add_column :options, :bw_pass, :string
    add_column :options, :bw_server, :string
    add_column :options, :twitter_user, :string
    add_column :options, :twitter_pass, :string
    add_column :options, :news_feed, :string
  end

  def self.down
  end
end
