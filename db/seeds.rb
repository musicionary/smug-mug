require_relative '../lib/user'
require_relative '../lib/farmer'
require_relative '../lib/roaster'
require_relative '../lib/customer'
require_relative '../lib/roast'


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

Roast.create(name: 'Brazil Canaan Estate', roast_date: '01-05-2016', roast_type: "Medium", notes: "Dark chocolate, nougat, honey.", price: 15.50, ounces: 12, roaster_id: 1, user_id: 1, image_url: 'coffee_bag_1.jpg', description: "When dark chocolate and nougat mingle with berry and honey notes and carry a lingering almond finish, you know you’re sipping something special. This offering from Brazil is full-bodied, low in acidity, sweet, smooth, and rich: a very balanced cup.")

Roast.create(name: 'Malawi Misuku', roast_date: '01-05-2016', roast_type: "Light", notes: "Orange blossom, cocoa & cranberry streusel.", price: 17.00, ounces: 12, roaster_id: 2, user_id: 2, image_url: 'coffee_bag_2.jpg', description: "A medium-full bodied coffee, this lot from the Misuku Cooperative in Malawi balances delicate floral aromatics with rich cocoa in the cup. We love the buttery mouthfeel that reminds us of a fine Peruvian coffee with a sweet cranberry acidity in the finish.")

Roast.create(name: 'Kenya Ngunguru', roast_date: '01-05-2016', roast_type: "Medium", notes: "Lemonade, pink peppercorn, Oolong tea.", price: 18.00, ounces: 12, roaster_id: 3, user_id: 3, image_url: 'coffee_bag_3.jpg', description: "Fragrances of grapefruit bitters and pungent black currant join molasses, paprika, and smoked sea salt. Notes of pomegranate and pineapple pair with vanilla, cranberry juice, and Sweet Tarts. Sweet spice and black tea bring a rounded finish.")

Roast.create(name: 'Ethiopia Reko', roast_date: '01-05-2016', roast_type: "Light/Medium", notes: "Key lime, clove, honey.", price: 18.25, ounces: 12, roaster_id: 4, user_id: 4, image_url: 'coffee_bag_4.jpg', description: "This coffee sparkles with a plush candied character reminiscent of Key lime pie. Fragrances of cardamom, clove and honey give way to flavors of Lemoncello, green apple, chamomile, and melon. Silky in body, the cup finishes with a sweet honey-nougat aftertaste.")

Roast.create(name: 'Costa Rica Tarrazu', roast_date: '01-05-2016', roast_type: "Medium", notes: "Fuji apple, pecan pie, honey graham.", price: 18.00, ounces: 12, roaster_id: 5, user_id: 5, image_url: 'coffee_bag_5.jpg', description: "Chocolate malt and honey graham are layered with attributes of banana bread, fuji apple, and pecan pie. This Costa Rica has an articulate body and a sweet acidity.")

Roast.create(name: 'Guatemala Luz de la Noche, Waykan', roast_date: '01-05-2016', roast_type: "Medium", notes: "Herbal, green grape, lemon.
", price: 17.00, ounces: 12, roaster_id: 6, user_id: 6, image_url: 'coffee_bag_6.jpg', description: "This coffee offers an herbal cup with green grape, lemon and nut layering together with a citric and tartaric acidity. Huehuetenangos typically exhibit a fruitier profile than other regions in Guatemala. This may be due to the common practice of stacking coffee higher on the patios than normal. Even if this may not be the most ideal in terms of efficient drying, the resulting cup is distinctly Huehue.")
