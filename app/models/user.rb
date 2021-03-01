class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments

  enum role: %w[admin user]

  def posts?
    posts.present?
  end
end
