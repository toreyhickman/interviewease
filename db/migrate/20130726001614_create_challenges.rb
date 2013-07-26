class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.text :questions
      t.belongs_to :company
      t.belongs_to :interview

      t.timestamps
    end
  end
end
