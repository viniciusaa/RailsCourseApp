class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save :capitalize_name

  validates :name, presence: true, length: { minimum: 3, maximum: 35 },
                                   uniqueness: { case_sensitive: false }
  validates :email, presence: true,
                    uniqueness: {case_sensitive: false },
                    length: { maximum: 41 },
                    format: { with: VALID_EMAIL_REGEX }
  default_scope -> { order(created_at: :desc) }
  has_many :recipes

  def capitalize_name
    self.name = name.split.map(&:capitalize)*' '
  end
end
