class CreateFeedbackResponses < ActiveRecord::Migration
  def up
    create_table :feedback_responses do |t|
      t.belongs_to :feedback_question
      t.belongs_to :employee
      t.belongs_to :candidate
      t.text :response
    end
  end

  def down
    drop_table :feedback_responses
  end
end
