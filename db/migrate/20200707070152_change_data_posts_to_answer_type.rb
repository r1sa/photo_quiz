class ChangeDataPostsToAnswerType < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :answer_type, :integer
  end
end
