class User < ActiveRecord::Base
  has_many :hosts

<<<<<<< HEAD
  has_secure_password #bcrypt
=======
  has_secure_password # BCrypt gem 
>>>>>>> d2654cc02b77f143c280c9bbe8609b02bf1ece78

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end

end
