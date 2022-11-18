class User < ApplicationRecord



  def twitter
    auth_hash = request.env["omniauth.auth"]
    @image_url = auth_hash[:info][:image]
  end
end
