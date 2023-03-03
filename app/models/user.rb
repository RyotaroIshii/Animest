class User < ApplicationRecord
  validates :name,invalid_words: true
  validates :description,invalid_words: true, length: { maximum: 250 }
  has_many :quests


end
