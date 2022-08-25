require_relative '../lib/populator_fix.rb'

# categories = ['Appliances', 'Vehicles', 'Games', 'Mobiles']
# categories2 = ['Watches', 'Toys', 'Food', 'Gym']
# categories3 = ['Clothes', 'Computers, Tablets and IT Accessories', 'Health & Personal Care', 'Shop Laptops & Tablets']


# categories3.each do |c|
#     Category.create(name:c)
# end
# categories4.each do |c|
#     Category.create(name:c)
# end
# categories5.each do |c|
#     Category.create(name:c)
# end

# clothes = [
#     {name:"Champion Women's Powerblend Joggers, Script Logo", brand:"Champion Store", cat:[9]},
#     {name:"Under Armour Girls' Play Up Solid Shorts", brand:"Armour Store", cat:[9]},
#     {name:"Hanes Men's Full-Zip Eco-Smart Hoodie", brand:"Hanes Store", cat:[9]},
#     {name:"Under Armour Men’s Tech 2.0 ½ Zip Long Sleeve", brand:"Armour Store", cat:[9]},
#     {name:"Legendary Whitetails Men's Non-Typical Long Sleeve T-Shirt", brand:"Whitetails Store", cat:[9]}
# ]

# comp = [
#     {name:"Wacom DTK2420K0 Cintiq Pro 24 Creative Pen Display – 4K Graphic Drawing Monitor with 8192 Pen Pressure and 99% Adobe RGB , Black", brand:"Wacom", cat:[10, 12]},
#     {name:'StarTech.com Unisex Backpack Ergonomic Computer Bag with Removable Accessory Case-Notebook/Tablet Pockets-Nylon, Black, 15.6" Professional IT Tech Work/Travel/Commute (NTBKBAG156)', brand:"StarTech.com Store", cat:[10, 12]},
#     {name:"One by Wacom Small Graphics Drawing Tablet 8.3 x 5.7 Inches, Portable Versatile for Students and Creators, Ergonomic 2048 Pressure Sensitive Pen Included, Compatible with Chromebook Mac and Windows", brand:"Wacom Store", cat:[10, 12]},
#     {name:"Logitech C270 HD Webcam, HD 720p, Widescreen HD Video Calling, HD Light Correction, Noise-Reducing Mic, For Skype, FaceTime, Hangouts, WebEx, PC/Mac/Laptop/Macbook/Tablet - Black", brand:"Logitech Store", cat:[10, 12]},
#     {name:"Samsung Galaxy Tab A8 Android Tablet, 10.5” LCD Screen, 64GB Storage, Long-Lasting Battery, Kids Content, Smart Switch, Expandable Memory, Dark Gray", brand:"SAMSUNG Store", cat:[10, 12]}
# ]

# health = [
#     {name:"Dove Men+Care Hair + Skin Care Regimen Personal Care for Men Clean Comfort + Fresh & Clean Body Wash, 2-in-1 Shampoo and Conditioner, and Antiperspirant Clinical Deodorant", brand:"Dove Store", cat:[11]},
#     {name:"Personal and Professional Growth for Health Care Professionals Illustrated Edition", brand:"David Tipton (Author)", cat:[11]},
#     {name:"HOME HEALTH AIDE TRAINING HANBOOK: A Practical Guide for Training Home Health Aides and Personal Care Assistants Paperback – January 18, 2017", brand:"Janet Brown BSN MSN (Author), Evelyn Russell MSN-Ed RN CHPN CLNC (Author)", cat:[11]},
#     {name:"Japan Health and Personal Care - Six Heat-Like Sheet Children *AF27*", brand:"Brand: Fever-like sheet", cat:[11]},
#     {name:"Japan Health and Personal Care - Minon amino Moist Moist barrier cream 35gAF27", brand:"MINON (Minon)", cat:[11]}
# ]

# laptop = [
#     {name:'LG Gram (2022) 14T90Q 2-in-1 Tablet Laptop, 14" (1920x1200) IPS Display, Intel Evo 12th Gen i5 1240P Processor, 16GB LPDDR5, 512GB NVMe SSD, FHD Webcam, WiFi 6E, Thunderbolt 4, Windows 11, Black', brand:"LG Store", cat:[10, 12]},
#     {name:"ASUS VivoBook Flip 14 Thin and Light 2-in-1 Laptop, 14” FHD Touch, 11th Gen Intel Core i3-1115G4, 4GB RAM, 128GB SSD, Thunderbolt 4, Fingerprint, Windows 10 Home in S Mode, Indie Black, TP470EA-AS34T", brand:"ASUS Store", cat:[10, 12]},
#     {name:'Lenovo IdeaPad 3 11 Chromebook Laptop, 11.6" HD Display, Intel Celeron N4020, 4GB RAM, 64GB Storage, Intel UHD Graphics 600, Chrome OS, Onyx Black', brand:"Lenovo Store", cat:[10, 12]},
#     {name:'Acer Aspire 5 A515-56-36UT, 15.6" Full HD Display, 11th Gen Intel Core i3-1115G4 Processor, 4GB DDR4, 128GB NVMe SSD, WiFi 6, Windows 11 Home (S Mode)', brand:"Acer Store", cat:[10, 12]},
#     {name:"ASUS ROG Flow Z13 (2022) Gaming Laptop Tablet, 13.4” 120Hz FHD+ Display, NVIDIA GeForce RTX 3050, Intel Core i7-12700H, 16GB LPDDR5, 512GB PCIe SSD, Detachable RGB Keyboard, Windows 11, GZ301ZC-PS73", brand:"ASUS Store", cat:[10, 12]}
# ]

# clothes.each do |w| 
#     p = Product.create(seller_id:9, 
#         name:w[:name], 
#         brand:w[:brand], 
#         price:Faker::Number.within(range: 100..5000),
#         count:Faker::Number.within(range: 0..100))
#     p.category_ids = w[:cat]
# end

# comp.each do |w| 
#     p = Product.create(seller_id:9, 
#         name:w[:name], 
#         brand:w[:brand], 
#         price:Faker::Number.within(range: 100..5000),
#         count:Faker::Number.within(range: 0..100))
#     p.category_ids = w[:cat]
# end

# health.each do |w| 
#     p = Product.create(seller_id:10, 
#         name:w[:name], 
#         brand:w[:brand], 
#         price:Faker::Number.within(range: 100..5000),
#         count:Faker::Number.within(range: 0..100))
#     p.category_ids = w[:cat]
# end

# laptop.each do |w| 
#     p = Product.create(seller_id:10, 
#         name:w[:name], 
#         brand:w[:brand], 
#         price:Faker::Number.within(range: 100..5000),
#         count:Faker::Number.within(range: 0..100))
#     p.category_ids = w[:cat]
# end

# watches = [
#     {name:"Timex Men's Expedition Scout 40 Watch", brand:'Timex', cat:[5, 1]},
#     {name:"Timex Ironman Classic 30 Full-Size 38mm Watch", brand:'Timex', cat:[5, 1]},
#     {name:'Garmin epix Gen 2, Premium active smartwatch, Health and wellness features, touchscreen AMOLED display, adventure watch with advanced features, white titanium',brand:'amazfit', cat:[5, 1]},
#     {name:"Classic Quartz Men's Watch, Stainless Steel, Silver-Tone", brand:'Bulova', cat:[5, 1]},
#     {name:"Men's Classic Leather Strap Watch", brand:'Bulova', cat:[5, 1]}
# ]

# toys = [
#     {name:'Shot in the Dark - Moose Games - The Ultimate Unorthodox Quiz Game, Multicolor, 91022', brand:'	Shot in the Dark', cat:[6]},
#     {name:"LEGO Star Wars Ultimate Millennium Falcon 75192 Expert Building Kit and Starship Model, Best Gift and Movie Collectible for Adults (7541 Pieces)", brand:'LEGO', cat:[6]},
#     {name:"Magic Mixies Magical Misting Cauldron with Interactive 8 inch Blue Plush Toy and 50+ Sounds and Reactions, Multicolor", brand:'	Magic Mixies', cat:[6]},
#     {name:"Stages Sensory Builder: Push Pop Bubble Fidget Sensory Toy for Anxiety, Autism, ADD and ADHU, popit Special Needs Stress Reliever: Popit Round, Green", brand:'	Stages', cat:[6]},
#     {name:"Manhattan Toy Winkel Rattle & Sensory Teether Toy", brand:'Manhattan Toy', cat:[6]}
# ]

# food = [
#     {name:"Frito-Lay Ultimate Snack Care Package, Variety Assortment of Chips, Cookies, Crackers & More, 40 Count", brand:'	Frito-Lay', cat:[7]},
#     {name:"Hill's Prescription Diet i/d Digestive Care Dry Dog Food, Veterinary Diet", brand:"	HILL'S PRESCRIPTION DIET", cat:[7]},
#     {name:"Purina ONE SmartBlend Natural Adult Chicken & Rice Dry Dog Food", brand:"Purina ONE", cat:[7]},
#     {name:"Hill's Prescription Diet z/d Skin/Food Sensitivities Dry Dog Food, Veterinary Diet", brand:"	HILL'S PRESCRIPTION DIET", cat:[7]},
#     {name:"Augason Farms Breakfast and Dinner Variety Pail Emergency Food Supply Everyday Meals 4 Gallon Pail", brand:"Augason Farms", cat:[7]}
# ]

# gym = [
#     {name:"A Frame Dumbbell Rack Multifunctional Weight Stand for Home Gym Suitable for Storage of Dumbbell, Weight Plates", brand:"Elevens", cat:[8]},
#     {name:"Marcy Smith Cage Machine with Workout Bench and Weight Bar Home Gym Equipment SM-4008", brand:"Marcy", cat:[8]},
#     {name:"Bowflex PR3000 Home Gym", brand:"Bowflex", cat:[8]},
#     {name:"Marcy 150lb. Stack Home Gym with Pulley, Arm, and Leg Developer Multifunctional Workout Station for Weightlifting and Bodybuilding – 300 lbs Capacity MWM-4965", brand:"Marcy", cat:[8]},
#     {name:"Amazon Essentials Women's Tech Stretch Relaxed-Fit Racerback Tank Top, Pack of 2", brand:"Amazon Essentials", cat:[8, 9]}
# ]

# watches.each do |w| 
#     p = Product.create(seller_id:9, 
#         name:w[:name], 
#         brand:w[:brand], 
#         price:Faker::Number.within(range: 100..5000),
#         count:Faker::Number.within(range: 0..100))
#     p.category_ids = w[:cat]
# end

# toys.each do |w| 
#     p = Product.create(seller_id:9, 
#         name:w[:name], 
#         brand:w[:brand], 
#         price:Faker::Number.within(range: 100..5000),
#         count:Faker::Number.within(range: 0..100))
#     p.category_ids = w[:cat]
# end

# food.each do |w| 
#     p = Product.create(seller_id:10, 
#         name:w[:name], 
#         brand:w[:brand], 
#         price:Faker::Number.within(range: 100..5000),
#         count:Faker::Number.within(range: 0..100))
#     p.category_ids = w[:cat]
# end

# gym.each do |w| 
#     p = Product.create(seller_id:10, 
#         name:w[:name], 
#         brand:w[:brand], 
#         price:Faker::Number.within(range: 100..5000),
#         count:Faker::Number.within(range: 0..100))
#     p.category_ids = w[:cat]
# end


# mobiles = [
#     {name:'Galaxy A33', brand:'Samsung'},
#     {name:'Note 12 Vip', brand:'Infinix'},
#     {name:'Xiaomi 12', brand:'Xiaomi'},
#     {name:'Vision 2s', brand:'itel'},
#     {name:'Pop 5', brand:'tecno'}
# ]

# 5.times do
#     s = User.create(
#         name:Faker::Name.name,
#         email:Faker::Internet.email, 
#         password:Faker::Internet.password, 
#         user_type:'seller',
#         phone_no:'03104304411'
#     )

#     Address.populate 1 do |d|
#         d.user_id = s.id
#         d.city = Faker::Address.city 
#         d.street_address = Faker::Address.street_address 
#         d.zipcode = '12345'
#     end

#     5.times do 
#         p = Product.create(seller_id:s.id, 
#             name:Faker::Appliance.equipment, 
#             brand:Faker::Appliance.brand, 
#             price:Faker::Number.within(range: 100..5000),
#             count:Faker::Number.within(range: 0..100))
#         p.category_ids = [Category.first.id, Category.fourth.id]
#     end

#     5.times do 
#         p = Product.create(seller_id:s.id, 
#             name:Faker::Vehicle.model, 
#             brand:Faker::Vehicle.make, 
#             price:Faker::Number.within(range: 1000000..5000000),
#             count:Faker::Number.within(range: 0..100))
#         p.category_ids = [Category.second.id]
#     end

#     5.times do 
#         p = Product.create(seller_id:s.id, 
#             name:Faker::Game.title, 
#             brand:Faker::Game.genre, 
#             price:Faker::Number.within(range: 100..500),
#             count:Faker::Number.within(range: 0..100))
#         p.category_ids = [Category.third.id]
#     end

#     mobiles.each do |m|
#         p = Product.create(seller_id:s.id, name:m[:name], brand:m[:brand], price:Faker::Number.within(range: 30000..100000), count:Faker::Number.within(range: 0..100))
#         p.category_ids = [Category.first.id, Category.fourth.id]
#     end

# end

# 5.times do 
#     u = User.create(
#         name:Faker::Name.name,
#         email:Faker::Internet.email, 
#         password:Faker::Internet.password, 
#         user_type:'buyer',
#         phone_no:'03104304411'
#     )
# end

# (6..15).to_a.shuffle.take(4).each do |id|
#     Product.all.each do |p|
#         p.comments << Comment.new(user_id:id, review:Faker::Lorem.sentence(word_count:4))
#         p.save! 
#     end
# end

# Product.all.each do |p|
#     p.comments << Comment.new(user_id:3, review:Faker::Lorem.sentence(word_count:4))
#     p.save! 
# end



