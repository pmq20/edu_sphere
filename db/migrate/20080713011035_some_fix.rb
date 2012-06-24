class SomeFix < ActiveRecord::Migration
  def self.up
  	remove_column :view_widgets,:order
  	add_column :view_widgets,:ordernum,:integer
  	add_column :view_widgets,:setting_type,:integer
  end

  def self.down
  	remove_column :view_widgets,:setting_type
  	remove_column :view_widgets,:ordernum
  	add_column :view_widgets,:order,:integer
  end
end
