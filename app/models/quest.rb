class Quest < ApplicationRecord
  has_one_attached :title
  belongs_to :user
end
