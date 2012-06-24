class Fix4 < ActiveRecord::Migration
  def self.up
  	add_column :view_widgets,:has_new,:integer
  end

  def self.down
  	remove_column :view_widgets,:has_new
  end
end
