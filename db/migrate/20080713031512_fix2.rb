class Fix2 < ActiveRecord::Migration
  def self.up
  	add_column :viewpages,:vw_type,:integer
  end

  def self.down
  	remove_column :viewpages,:vw_type
  end
end
