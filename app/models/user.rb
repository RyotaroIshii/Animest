class User < ApplicationRecord
  has_many :quests
  has_many :titles
  
  
end
