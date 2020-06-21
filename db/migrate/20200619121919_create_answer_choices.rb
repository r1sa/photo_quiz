class CreateAnswerChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :answer_choices do |t|
      t.integer :post_id
      t.text :answer

      t.timestamps
    end
  end
end
