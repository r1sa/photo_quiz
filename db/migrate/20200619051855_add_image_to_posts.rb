class AddImageToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :image, :string, after: :date
  end
end
