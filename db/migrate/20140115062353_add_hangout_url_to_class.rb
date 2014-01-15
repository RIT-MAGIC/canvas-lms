class AddHangoutUrlToClass < ActiveRecord::Migration
  tag :predeploy

  def self.up
    add_column :courses, :hangout_url, :string
  end

  def self.down
    remove_column :courses, :hangout_url
  end
end
