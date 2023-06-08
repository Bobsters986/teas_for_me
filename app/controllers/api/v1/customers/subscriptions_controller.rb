class Api::V1::Customers::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    render json: SubscriptionSerializer.new(customer.subscriptions)
  end

  def create
    customer = Customer.find(params[:customer_id])
    subscription = customer.subscriptions.new(subscription_params)

    if subscription.save
      create_subscription_teas(subscription)
      render json: SubscriptionSerializer.new(subscription), status: 201
    else
      render json: { errors: subscription.errors.full_messages.join(', ') }, status: 400
    end
  end

  def update
    customer = Customer.find(params[:customer_id])
    subscription = Subscription.find(params[:id])

    if subscription.update(subscription_params)
      update_subscription_teas(subscription)
      render json: SubscriptionSerializer.new(subscription), status: 200
    else
      render json: { errors: subscription.errors.full_messages.join(', ') }, status: 400
    end
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency, :customer_id, :teas)
  end

  def create_subscription_teas(subscription)
    params[:teas].each do |tea_id|
      tea = Tea.find(tea_id)

      if !tea.nil?
        SubscriptionTea.create!(tea: tea, subscription: subscription)
      end
    end
  end

  def update_subscription_teas(subscription)
    subscription.subscription_teas.destroy_all
    create_subscription_teas(subscription)
  end

  # def delete_subscription_teas(subscription)
  #   subscription.subscription_teas.destroy_all
  # end
end
