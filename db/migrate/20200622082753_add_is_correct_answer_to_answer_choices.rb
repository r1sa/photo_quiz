class AddIsCorrectAnswerToAnswerChoices < ActiveRecord::Migration[6.0]
  def change
    add_column :answer_choices, :is_correct_answer, :boolean,null: false, default: false, after: :answer
  end
end
