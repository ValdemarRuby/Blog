class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_one_attached :file

  validates :title, presence: true
  validates :content, presence: true
  validate :file_size

  def file_size
    errors.add :file, 'too big, max size 2MB' if file.attached? && file.blob.byte_size > 2_000_000
  end
end
