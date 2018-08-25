class User < ActiveRecord::Base
  has_many :hosts

  has_secure_password #bcrypt

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end

end
