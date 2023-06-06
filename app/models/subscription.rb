class Subscription < ApplicationRecord
  validates_presence_of :title, :status, :frequency
  validates :price, presence: true, numericality: true
  
  enum status: [:active, :cancelled]
  enum frequency: [:weekly, :monthly, :quarterly]

  belongs_to :customer
  belongs_to :tea
end
