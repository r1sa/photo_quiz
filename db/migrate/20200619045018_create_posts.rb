class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.date :date
      t.string :title
      t.text :comment

      t.timestamps
    end
  end
end
