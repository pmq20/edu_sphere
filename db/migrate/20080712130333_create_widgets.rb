class CreateWidgets < ActiveRecord::Migration
  def self.up
    create_table :widgets do |t|
			t.string :name
			t.string :dom_id
      t.timestamps
    end
  end

  def self.down
    drop_table :widgets
  end
end
