class Subscription < ApplicationRecord
  validates_presence_of :title, :status, :frequency
  validates :price, presence: true, numericality: true
  
  enum status: [:active, :cancelled]
  enum frequency: [:weekly, :monthly, :quarterly]

  belongs_to :customer
  has_many :subscription_teas, dependent: :destroy
  has_many :teas, through: :subscription_teas
end
