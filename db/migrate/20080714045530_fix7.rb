class Fix7 < ActiveRecord::Migration
  def self.up
  	remove_column :view_widgets,:number_new
  	remove_column :view_widgets,:has_new
  end

  def self.down
  	add_column :view_widgets,:has_new,:integer
  	add_column :view_widgets,:number_new,:integer
  end
end
