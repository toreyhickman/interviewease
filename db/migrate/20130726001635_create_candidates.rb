class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.belongs_to :company

      t.timestamps
    end
  end
end
