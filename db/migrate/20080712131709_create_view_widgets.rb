class CreateViewWidgets < ActiveRecord::Migration
  def self.up
    create_table :view_widgets do |t|
			t.integer :user_id,:viewpage_id,:widget_id
			t.integer :order,:number
      t.timestamps
    end
  end

  def self.down
    drop_table :view_widgets
  end
end
