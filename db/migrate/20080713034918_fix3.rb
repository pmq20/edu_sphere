class Fix3 < ActiveRecord::Migration
  def self.up
  	remove_column :view_widgets,:ordernum
  	add_column :view_widgets,:number_new,:integer
  end

  def self.down
  	remove_column :view_widgets,:number_new
  	add_column :view_widgets,:ordernum,:integer
  end
end
