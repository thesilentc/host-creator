class Host < ActiveRecord::Base
  belongs_to :host
  validates :content, uniqueness: true

end
