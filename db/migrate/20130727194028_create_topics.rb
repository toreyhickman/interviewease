class CreateTopics < ActiveRecord::Migration
  def up
    create_table :topics do |t|
      t.string :name
      t.belongs_to :company
      
      t.timestamps  
    end
  end

  def down
    drop_table :topics
  end
end
