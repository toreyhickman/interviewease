class CreateFeedbackQuestions < ActiveRecord::Migration
  def up
    create_table :feedback_questions do |t|
      t.string :prompt
      t.belongs_to :question, polymorphic: true
    end
  end

  def down
    drop_table :feedback_questions
  end
end
