require 'rails_helper'

RSpec.describe 'Customer Subscriptions API' do
  before :each do
    @customer = create(:customer)

    @subscription1 = create(:subscription, customer: @customer)
    @subscription2 = create(:subscription, customer: @customer, status: 1)
    @subscription3 = create(:subscription, customer: @customer, status: 1)

    @tea_1 = create(:tea)
    @tea_2 = create(:tea)
    @tea_3 = create(:tea)

    @subscription_tea1 = create(:subscription_tea, subscription: @subscription1, tea: @tea_1)
    @subscription_tea2 = create(:subscription_tea, subscription: @subscription1, tea: @tea_2)

    @subscription_tea3 = create(:subscription_tea, subscription: @subscription2, tea: @tea_2)
    @subscription_tea4 = create(:subscription_tea, subscription: @subscription2, tea: @tea_3)

    @subscription_tea5 = create(:subscription_tea, subscription: @subscription3, tea: @tea_1)
    @subscription_tea6 = create(:subscription_tea, subscription: @subscription3, tea: @tea_3)
  end

  describe 'Customer Subscriptions Index' do
    context 'when successful' do
      it 'returns a list of all subscriptions for a customer' do
        get api_v1_customer_subscriptions_path(@customer.id)

        expect(response).to be_successful

        subscriptions = JSON.parse(response.body, symbolize_names: true)

        expect(subscriptions[:data].count).to eq(3)
        expect(subscriptions[:data].sample.keys).to eq([:id, :type, :attributes])
        expect(subscriptions[:data][0][:attributes].keys).to eq([:title, :price, :status, :frequency, :teas])
        expect(subscriptions[:data][0][:id]).to eq(@subscription1.id.to_s)
        expect(subscriptions[:data][0][:type]).to eq('subscription')
        expect(subscriptions[:data][0][:attributes][:title]).to eq(@subscription1.title)
        expect(subscriptions[:data][0][:attributes][:price]).to eq(@subscription1.price)
        expect(subscriptions[:data][0][:attributes][:status]).to eq(@subscription1.status)
        expect(subscriptions[:data][0][:attributes][:frequency]).to eq(@subscription1.frequency)
        expect(subscriptions[:data][0][:attributes][:teas].count).to eq(2)
        expect(subscriptions[:data][0][:attributes][:teas][0][:id]).to eq(@tea_1.id)
        expect(subscriptions[:data][0][:attributes][:teas][0][:title]).to eq(@tea_1.title)
      end
    end

    context 'when unsuccessful' do
      it 'returns a 404 if customer does not exist' do
        get api_v1_customer_subscriptions_path(999)

        parsed = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(404)
        expect(parsed[:errors]).to eq("Couldn't find Customer with 'id'=999")
      end
    end
  end
end
