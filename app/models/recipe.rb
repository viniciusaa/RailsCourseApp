class Recipe < ApplicationRecord
  before_save :capitalize_name

  validates :name, presence: true, length: { minimum: 3, maximum: 35 },
                                   uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { minimum: 10 }
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }
  belongs_to :user

  def capitalize_name
    self.name.capitalize!
  end
end
