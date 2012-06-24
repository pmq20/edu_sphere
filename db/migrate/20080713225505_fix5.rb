class Fix5 < ActiveRecord::Migration
  def self.up
  	remove_column :viewpages,:vw_type
  end

  def self.down
  	add_column :viewpages,:vw_type
  end
end
