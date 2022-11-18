class User < ApplicationRecord
  # has_one_attached :image


  def twitter
    auth_hash = request.env["omniauth.auth"]
    @image_url = auth_hash[:info][:image]
  end
end
