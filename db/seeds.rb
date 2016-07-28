require_relative '../lib/user'
require_relative '../lib/farmer'
require_relative '../lib/roaster'
require_relative '../lib/customer'

# FARMERS #
User.create(id: 1, name: "Addisu Kidane", email: "addisu@gmail.com", password: "12345789", user_type: "farmer")
User.create(id: 2, name: "Sergio Diaz", email: "sergio@gmail.com", password: "12356789", user_type: "farmer")
User.create(id: 3, name: "Anita Diaz", email: "anita@gmail.com", password: "12356789", user_type: "farmer")
User.create(id: 4, name: "Marcos Croce", email: "marcos@gmail.com", password: "12356789", user_type: "farmer")
User.create(id: 5, name: "Pedro Echavarra", email: "pedro@gmail.com", password: "12356789", user_type: "farmer")
User.create(id: 6, name: "Joaquin Esteban", email: "joaquin@gmail.com", password: "12356789", user_type: "farmer")

Farmer.create(country: "Burundi", city: "Rango", phone_number: '111-111-1111', elevation: '1800m', varietal: 'Bourbon', crop_cost: 19.99, shipping_cost: 4.99, user_id: 1, image_url: 'grower_image_1.jpg')
Farmer.create(country: "Brazil", city: "Carmo de Minas", phone_number: '111-111-2222', elevation: '1400m', varietal: 'Bourbon', crop_cost: 19.99, shipping_cost: 4.99, user_id: 2, image_url: 'grower_image_2.jpg')
Farmer.create(country: "Brazil", city: "Carmo de Minas", phone_number: '111-111-3333', elevation: '1400m', varietal: 'Bourbon', crop_cost: 19.99, shipping_cost: 4.99, user_id: 3, image_url: 'grower_image_3.jpg')
Farmer.create(country: "Brazil", city: "Mococa", phone_number: '111-111-4444', elevation: '1200m', varietal: 'Catuai', crop_cost: 19.99, shipping_cost: 4.99, user_id: 4, image_url: 'grower_image_4.jpg')
Farmer.create(country: "Mexico", city: "Zihuatanejo", phone_number: '111-111-5555', elevation: '1500m', varietal: 'Harar', crop_cost: 19.99, shipping_cost: 4.99, user_id: 5, image_url: 'grower_image_5.jpg')
Farmer.create(country: "Colombia", city: "Piendamo", phone_number: '111-111-6666', elevation: '1675m', varietal: 'Caturra', crop_cost: 19.99, shipping_cost: 4.99, user_id: 6, image_url: 'grower_image_6.jpg')


# ROASTERS #

User.create(id: 7, name: "Bold Bean Coffee", email: "boldbeancoffee@gmail.com", password: "12356789", user_type: "roaster")
User.create(id: 8, name: "Tinker Coffee Co.", email: "tinkercoffeeco@gmail.com", password: "12356789", user_type: "roaster")
User.create(id: 9, name: "Mast Coffee Co.", email: "mastcoffeeco@gmail.com", password: "12356789", user_type: "roaster")
User.create(id: 10, name: "Paradise Coffee Roasters", email: "paradisecoffee@gmail.com", password: "12356789", user_type: "roaster")
User.create(id: 11, name: "James Coffee Co.", email: "jamescoffee@gmail.com", password: "12356789", user_type: "roaster")
User.create(id: 12, name: "Theodore's Coffee", email: "theodorecoffee@gmail.com", password: "12356789", user_type: "roaster")

Roaster.create(street: '1 1st Ave', city: 'Jacksonville Beach', state: 'FL', zip: '11111', phone_number: '222-222-1111', user_id: 7, image_url: 'roaster_logo_1.png')
Roaster.create(street: '2 2nd Ave', city: 'Indianapolis', state: 'IN', zip: '22222', phone_number: '222-222-2222', user_id: 8, image_url: 'roaster_logo_2.png')
Roaster.create(street: '3 3rd Ave', city: 'Rocklin', state: 'CA', zip: '33333', phone_number: '222-222-3333', user_id: 9, image_url: 'roaster_logo_3.png')
Roaster.create(street: '4 4th Ave', city: 'Ramsey', state: 'MN', zip: '44444', phone_number: '222-222-4444', user_id: 10, image_url: 'roaster_logo_4.png')
Roaster.create(street: '5 5th Ave', city: 'San Diego', state: 'CA', zip: '55555', phone_number: '222-222-5555', user_id: 11, image_url: 'roaster_logo_5.png')
Roaster.create(street: '6 6th Ave', city: 'Owosso', state: 'MI', zip: '66666', phone_number: '222-222-6666', user_id: 12, image_url: 'roaster_logo_6.png')

# CUSTOMERS #

User.create(id: 13, name: "Bob", email: "bob@gmail.com", password: "12356789", user_type: "customer")
User.create(id: 14, name: "Bill", email: "bill@gmail.com", password: "12356789", user_type: "customer")
User.create(id: 15, name: "Jessica", email: "jessica@gmail.com", password: "12356789", user_type: "customer")
User.create(id: 16, name: "Sylvester", email: "sylvester@gmail.com", password: "12356789", user_type: "customer")
User.create(id: 17, name: "Maddie", email: "maddie@gmail.com", password: "12356789", user_type: "customer")
User.create(id: 18, name: "James", email: "james@gmail.com", password: "12356789", user_type: "customer")


Customer.create(street: '11 1st Ave', city: 'Portland', state: 'OR', zip: '97213', phone_number: '333-333-1111', user_id: 13)
Customer.create(street: '22 2nd Ave', city: 'Portland', state: 'OR', zip: '97213', phone_number: '333-333-2222', user_id: 14)
Customer.create(street: '33 3rd Ave', city: 'Portland', state: 'OR', zip: '97213', phone_number: '333-333-3333', user_id: 15)
Customer.create(street: '44 4th Ave', city: 'Portland', state: 'OR', zip: '97213', phone_number: '333-333-4444', user_id: 16)
Customer.create(street: '55 5th Ave', city: 'Portland', state: 'OR', zip: '97213', phone_number: '333-333-5555', user_id: 17)
Customer.create(street: '66 6th Ave', city: 'Portland', state: 'OR', zip: '97213', phone_number: '333-333-6666', user_id: 18)
