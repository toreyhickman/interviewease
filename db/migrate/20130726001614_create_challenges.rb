class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :description
      t.text :code
      t.text :test_code
      t.boolean :public, default: false
      t.belongs_to :company
      t.integer :author_id

      t.timestamps
    end
  end
end
