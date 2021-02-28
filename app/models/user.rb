class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts
  has_many :comments

  enum role: ['admin', 'user']

  def have_posts?
    self.posts.present?
  end
end