class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates :title, presence: true
  validates :external_url, presence: true, :format => {:with => URI.regexp}
end
