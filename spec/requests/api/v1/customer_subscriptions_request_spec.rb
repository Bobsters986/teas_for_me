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

    @headers = { 'CONTENT_TYPE' => 'application/json' }
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

  describe "Customer Subscriptions Create" do
    context "when successful" do
      it "creates a new subscription for a customer" do
        expect(@customer.subscriptions.count).to eq(3)

        subscription_params = {
          title: "Tea-licious Subscription",
          price: 10.00,
          status: "active",
          frequency: "monthly",
          teas: [@tea_1.id, @tea_2.id]
        }

        post api_v1_customer_subscriptions_path(@customer.id), headers: @headers, params: subscription_params, as: :json

        expect(response).to be_successful

        subscription = JSON.parse(response.body, symbolize_names: true)
        
        expect(subscription[:data][:id]).to eq(Subscription.last.id.to_s)
        expect(@customer.subscriptions.count).to eq(4)
        expect(subscription[:data][:type]).to eq('subscription')
        expect(subscription[:data][:attributes][:title]).to eq(subscription_params[:title])
        expect(subscription[:data][:attributes][:price]).to eq(subscription_params[:price])
        expect(subscription[:data][:attributes][:status]).to eq(subscription_params[:status])
        expect(subscription[:data][:attributes][:frequency]).to eq(subscription_params[:frequency])
        expect(subscription[:data][:attributes][:teas].count).to eq(2)
        expect(subscription[:data][:attributes][:teas][0][:id]).to eq(@tea_1.id)
        expect(subscription[:data][:attributes][:teas][0][:title]).to eq(@tea_1.title)
      end
    end

    context "when unsuccessful" do
      it "returns a 404 if customer does not exist" do
        subscription_params = {
          title: "Tea-licious Subscription",
          price: 10.00,
          status: 1,
          frequency: 0,
          teas: [@tea_1.id, @tea_2.id]
        }

        post api_v1_customer_subscriptions_path(999), headers: @headers, params: subscription_params, as: :json

        parsed = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(404)
        expect(parsed[:errors]).to eq("Couldn't find Customer with 'id'=999")
      end

      it "returns a 400 error if subscription is not created because of invalid params" do
        subscription_params = {
          title: "",
          price: "free",
          status: "active",
          frequency: "monthly",
          teas: [@tea_1.id, @tea_2.id]
        }

        post api_v1_customer_subscriptions_path(@customer.id), headers: @headers, params: subscription_params, as: :json

        parsed = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(400)
        expect(parsed[:errors]).to eq("Title can't be blank, Price is not a number")
      end

      it "returns a 404 error if subscription is not created because of invalid tea ids" do
        subscription_params = {
          title: "Tea-licious Subscription",
          price: 10.00,
          status: "active",
          frequency: "monthly",
          teas: [@tea_1.id, 888]
        }

        post api_v1_customer_subscriptions_path(@customer.id), headers: @headers, params: subscription_params, as: :json

        parsed = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(404)
        expect(parsed[:errors]).to eq("Couldn't find Tea with 'id'=888")
      end
    end
  end
end
