class Fix6 < ActiveRecord::Migration
  def self.up
  	remove_column :view_widgets,:setting_type
  	add_column :viewpages,:width,:integer
  end

  def self.down
  	remove_column :viewpages,:width
  	add_column :view_widgets,:setting_type,:integer
  end
end
