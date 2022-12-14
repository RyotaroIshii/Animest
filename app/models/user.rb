class User < ApplicationRecord
  validates :name,invalid_words: true

  has_many :quests
  has_many :titles


end
