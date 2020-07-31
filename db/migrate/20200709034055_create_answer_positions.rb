class CreateAnswerPositions < ActiveRecord::Migration[6.0]
  def change
    create_table :answer_positions do |t|
      t.integer :post_id
      t.integer :shape_type
      t.string :coords

      t.timestamps
    end
  end
end
