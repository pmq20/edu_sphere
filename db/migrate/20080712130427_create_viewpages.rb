class CreateViewpages < ActiveRecord::Migration
  def self.up
    create_table :viewpages do |t|
			t.string :identification
    	t.integer :number
      t.timestamps
    end
  end

  def self.down
    drop_table :viewpages
  end
end
