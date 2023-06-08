require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationships' do
    it { should belong_to :customer }
    it { should have_many :subscription_teas }
    it { should have_many(:teas).through(:subscription_teas) }
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :price }
    it { should validate_numericality_of :price }
    it { should validate_presence_of :status }
    it { should validate_presence_of :frequency }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(%i[active cancelled]) }
    it { should define_enum_for(:frequency).with_values(%i[weekly monthly quarterly]) }
  end
end
