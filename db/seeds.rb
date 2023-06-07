# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
SubscriptionTea.destroy_all
Subscription.destroy_all
Tea.destroy_all
Customer.destroy_all

customer = Customer.create(first_name: "Bob", last_name: "Smith", email: "bob_smith@fmail.com", address: "123 Main St")

subscription1 = Subscription.create(customer: customer, title: "Tea-riffic Subscription", price: 15.00, status: 0)
subscription2 = Subscription.create(customer: customer, title: "Steep Dreams Subscription", price: 10.00, status: 1)
subscription3 = Subscription.create(customer: customer, title: "Tea-licious Subscription", price: 10.00, status: 1, frequency: 0)

tea1 = Tea.create(title: "Green Tea", description: "Green tea is a type of tea that is made from Camellia sinensis leaves and buds that have not undergone the same withering and oxidation process used to make oolong teas and black teas.", temperature: 170, brew_time: 3)
tea2 = Tea.create(title: "Black Tea", description: "Black tea is a type of tea that is more oxidized than oolong, green, and white teas. Black tea is generally stronger in flavor than other teas.", temperature: 175, brew_time: 5)
tea3 = Tea.create(title: "Oolong Tea", description: "Oolong tea is a traditional Chinese tea. It is made from the leaves of the Camellia sinensis plant, the same plant used to make green tea and black tea. The difference is in how the tea is processed.", temperature: 180, brew_time: 7)

SubscriptionTea.create(subscription: subscription1, tea: tea1)
SubscriptionTea.create(subscription: subscription1, tea: tea2)

SubscriptionTea.create(subscription: subscription2, tea: tea2)
SubscriptionTea.create(subscription: subscription2, tea: tea3)

SubscriptionTea.create(subscription: subscription3, tea: tea1)
SubscriptionTea.create(subscription: subscription3, tea: tea3)