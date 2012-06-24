class CreateConfigdatas < ActiveRecord::Migration
  def self.up
    create_table :configdatas do |t|
			t.string :name
			t.text :value
      t.timestamps
    end
  end

  def self.down
    drop_table :configdatas
  end
end
