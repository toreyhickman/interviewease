class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.belongs_to :employee
      t.belongs_to :candidate
      t.boolean :complete, default: false
      t.datetime :start
      t.string :identifier
      t.boolean :recommend_hire

      t.timestamps
    end
  end
end
