class AddQuestionToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :question, :string, after: :comment
  end
end
