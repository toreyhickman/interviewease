class CreateGivenChallenges < ActiveRecord::Migration
  def up
    create_table :given_challenges do |t|
      t.belongs_to :challenge
      t.belongs_to :candidate
      t.belongs_to :interview
    end
  end

  def down
    drop_table :given_challenges
  end
end
