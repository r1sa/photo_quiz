class Post < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true
  validates :question, presence: true

  belongs_to :user

  has_many :answer_choices, dependent: :destroy
  accepts_nested_attributes_for :answer_choices, allow_destroy: true

  mount_uploader :image, ImageUploader
end
