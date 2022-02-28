class Book < ApplicationRecord

    belongs_to :user
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  #validates :name, length: { minimum: 1, maximum: 20 }
end
