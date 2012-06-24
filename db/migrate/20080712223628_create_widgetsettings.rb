class CreateWidgetsettings < ActiveRecord::Migration
  def self.up
    create_table :widgetsettings do |t|
			t.integer :widget_id
			t.integer :user_id
			t.string :name
			t.text :value
      t.timestamps
    end
  end

  def self.down
    drop_table :widgetsettings
  end
end
