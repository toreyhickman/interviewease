class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :password
      t.belongs_to :company
      has_many :interviews

      t.timestamps
    end
  end
end
