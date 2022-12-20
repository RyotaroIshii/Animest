class User < ApplicationRecord
  validates :name,invalid_words: true
  validates :description,invalid_words: true
  has_many :quests


end
