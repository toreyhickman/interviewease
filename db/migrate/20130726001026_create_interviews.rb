class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.string :name
      t.belongs_to :employee
      t.belongs_to :company

      t.timestamps
    end
  end
end
