class CreateCoveredTopics < ActiveRecord::Migration
  def up
    create_table :covered_topics do |t|
      t.belongs_to :topic
      t.belongs_to :candidate
    end
  end

  def down
    drop_table :covered_topics
  end
end
