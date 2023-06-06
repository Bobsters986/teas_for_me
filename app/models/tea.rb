class Tea < ApplicationRecord
  validates :temperature, presence: true, numericality: { greater_than_or_equal_to: 40, less_than_or_equal_to: 180 }
  validates :brew_time, presence: true, numericality: { greater_than: 0 }
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

  has_many :subscriptions, dependent: :destroy
  has_many :customers, through: :subscriptions
end
