class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.belongs_to :company

      t.timestamps
    end
  end
end
