class AnswerChoice < ApplicationRecord
  validates :answer, presence: true

  belongs_to :post
end
