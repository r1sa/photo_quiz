class AddAnswerTypeToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :answer_type, :string, after: :question
  end
end
