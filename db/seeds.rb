require 'faker'

args = ENV['FIXTURES']

# create categories
categories = [
  {
    id: 1,
    name: "Clothing and Apparel",
    description: Faker::Lorem.paragraph

  },
  {
    id: 2,
    parent_id: 1,
    name: "Men's Clothing",
    description: Faker::Lorem.paragraph
  },
  {
    id: 3,
    parent_id: 1,
    name: "Women's Clothing",
    description: Faker::Lorem.paragraph
  },
  {
    id: 4,
    parent_id: 1,
    name: "Trending",
    description: Faker::Lorem.paragraph
  },
  {
    id: 5,
    name: "Electronics",
    description: Faker::Lorem.paragraph
  },
  {
    id: 6,
    parent_id: 5,
    name: "3D Printer & Supplies",
    description: Faker::Lorem.paragraph
  },
  {
    id: 7,
    parent_id: 5,
    name: "Arduino Compatible SCM & DIY Kits",
    description: Faker::Lorem.paragraph
  },
  {
    id: 8,
    parent_id: 5,
    name: "Security & Protection",
    description: Faker::Lorem.paragraph
  },
  {
    id: 9,
    parent_id: 5,
    name: "Home Audio & Video",
    description: Faker::Lorem.paragraph
  },
  {
    id: 10,
    parent_id: 5,
    name: "Module Board For Arduino",
    description: Faker::Lorem.paragraph
  },
  {
    id: 11,
    parent_id: 5,
    name: "Photography & Camera Acc",
    description: Faker::Lorem.paragraph
  },
  {
    id: 12,
    parent_id: 5,
    name: "Media Players",
    description: Faker::Lorem.paragraph
  },
  {
    id: 13,
    parent_id: 5,
    name: "Video Games Accessories",
    description: Faker::Lorem.paragraph
  },
  {
    id: 14,
    parent_id: 5,
    name: "Plug & Adaptors",
    description: Faker::Lorem.paragraph
  },
  {
    id: 15,
    parent_id: 5,
    name: "Electronic Accessories & Gadgets",
    description: Faker::Lorem.paragraph
  },
  {
    id: 16,
    parent_id: 5,
    name: "Batteries & Chargers",
    description: Faker::Lorem.paragraph
  },
  {
    id: 17,
    name: "Home Appliances",
    description: Faker::Lorem.paragraph
  },
  {
    id: 18,
    parent_id: 17,
    name: "Cleaning Appliances",
    description: Faker::Lorem.paragraph
  },
  {
    id: 19,
    parent_id: 17,
    name: "Household Appliances",
    description: Faker::Lorem.paragraph
  },
  {
    id: 20,
    parent_id: 17,
    name: "Home Entertainments & Work",
    description: Faker::Lorem.paragraph
  },
  {
    id: 21,
    parent_id: 17,
    name: "Kitchen Appliances",
    description: Faker::Lorem.paragraph
  },
  {
    id: 22,
    parent_id: 17,
    name: "Air Conditioning Appliances",
    description: Faker::Lorem.paragraph
  },
  {
    id: 23,
    parent_id: 17,
    name: "Kitchen",
    description: Faker::Lorem.paragraph
  },
  {
    id: 24,
    parent_id: 17,
    name: "Kitchen Set",
    description: Faker::Lorem.paragraph
  },
  {
    id: 25,
    parent_id: 17,
    name: "Home Appliance Parts",
    description: Faker::Lorem.paragraph
  },
  {
    id: 26,
    parent_id: 17,
    name: "Bathroom Gadgets",
    description: Faker::Lorem.paragraph
  },
  {
    id: 27,
    name: "Health & Beauty",
    description: Faker::Lorem.paragraph
  },
  {
    id: 28,
    parent_id: 27,
    name: "Nail Art",
    description: Faker::Lorem.paragraph
  },
  {
    id: 29,
    parent_id: 27,
    name: "Eye Care",
    description: Faker::Lorem.paragraph
  },
  {
    id: 30,
    parent_id: 27,
    name: "Health Management",
    description: Faker::Lorem.paragraph
  },
  {
    id: 31,
    parent_id: 27,
    name: "Skin Care",
    description: Faker::Lorem.paragraph
  },
  {
    id: 32,
    parent_id: 27,
    name: "Teeth & Mouth Care",
    description: Faker::Lorem.paragraph
  },
  {
    id: 33,
    parent_id: 27,
    name: "Health Care",
    description: Faker::Lorem.paragraph
  },
  {
    id: 34,
    parent_id: 27,
    name: "Makeup",
    description: Faker::Lorem.paragraph
  },
  {
    id: 35,
    parent_id: 27,
    name: "Massages & Relaxing",
    description: Faker::Lorem.paragraph
  },
  {
    id: 36,
    parent_id: 27,
    name: "Hair Styling Tools & Salon",
    description: Faker::Lorem.paragraph
  },
  {
    id: 37,
    parent_id: 27,
    name: "Personal Care Supplies",
    description: Faker::Lorem.paragraph
  },
  {
    id: 38,
    parent_id: 27,
    name: "Shavers and Hair Removal",
    description: Faker::Lorem.paragraph
  },
  {
    id: 39,
    parent_id: 27,
    name: "Tattoos & Body Art",
    description: Faker::Lorem.paragraph
  },
  {
    id: 40,
    parent_id: 27,
    name: "Brace & Support",
    description: Faker::Lorem.paragraph
  },
  {
    id: 41,
    parent_id: 27,
    name: "Hair & Accessories",
    description: Faker::Lorem.paragraph
  },
  {
    id: 42,
    name: "Automobiles & Motorcycles",
    description: Faker::Lorem.paragraph
  },
  {
    id: 43,
    parent_id: 42,
    name: "Car Lights",
    description: Faker::Lorem.paragraph
  },
  {
    id: 44,
    parent_id: 42,
    name: "Car Alarm & Security",
    description: Faker::Lorem.paragraph
  },
  {
    id: 45,
    parent_id: 42,
    name: "Car Repair & Maintenance",
    description: Faker::Lorem.paragraph
  },
  {
    id: 46,
    parent_id: 42,
    name: "Car DVRs",
    description: Faker::Lorem.paragraph
  },
  {
    id: 47,
    parent_id: 42,
    name: "Diagnostic Scan Tool",
    description: Faker::Lorem.paragraph
  },
  {
    id: 48,
    parent_id: 42,
    name: "Motorcycle",
    description: Faker::Lorem.paragraph
  },
  {
    id: 49,
    parent_id: 42,
    name: "GPS & Accessories",
    description: Faker::Lorem.paragraph
  },
  {
    id: 50,
    parent_id: 42,
    name: "Auto Parts",
    description: Faker::Lorem.paragraph
  },
  {
    id: 51,
    parent_id: 42,
    name: "Electric Scooters",
    description: Faker::Lorem.paragraph
  },
  {
    id: 52,
    parent_id: 42,
    name: "Car Electronics",
    description: Faker::Lorem.paragraph
  },
  {
    id: 53,
    parent_id: 42,
    name: "Interior Accessories",
    description: Faker::Lorem.paragraph
  },
  {
    id: 54,
    parent_id: 42,
    name: "Boat",
    description: Faker::Lorem.paragraph
  },
  {
    id: 55,
    parent_id: 42,
    name: "Car Audio & Monitor",
    description: Faker::Lorem.paragraph
  },
  {
    id: 56,
    parent_id: 42,
    name: "Exterior Accessories",
    description: Faker::Lorem.paragraph
  },
  {
    id: 57,
    name: "Mobile Phones & Accessories",
    description: Faker::Lorem.paragraph
  },
  {
    id: 58,
    parent_id: 57,
    name: "Smartphones",
    description: Faker::Lorem.paragraph
  },
  {
    id: 59,
    parent_id: 57,
    name: "Earphones & Speakers",
    description: Faker::Lorem.paragraph
  },
  {
    id: 60,
    parent_id: 57,
    name: "Smart Watch & Band",
    description: Faker::Lorem.paragraph
  },
  {
    id: 61,
    parent_id: 57,
    name: "Feature Phones",
    description: Faker::Lorem.paragraph
  },
  {
    id: 62,
    parent_id: 57,
    name: "Mobile Phones Accessories",
    description: Faker::Lorem.paragraph
  },
  {
    id: 63,
    parent_id: 57,
    name: "Smart Devices & Accessories",
    description: Faker::Lorem.paragraph
  },
  {
    id: 64,
    parent_id: 57,
    name: "Power Banks",
    description: Faker::Lorem.paragraph
  },
  {
    id: 65,
    parent_id: 57,
    name: "Gadgets",
    description: Faker::Lorem.paragraph
  },
  {
    id: 66,
    parent_id: 57,
    name: "Samsung Accessories",
    description: Faker::Lorem.paragraph
  },
  {
    id: 67,
    parent_id: 57,
    name: "Chargers & Cables",
    description: Faker::Lorem.paragraph
  },
  {
    id: 68,
    parent_id: 57,
    name: "Mounts & Holders",
    description: Faker::Lorem.paragraph
  },
  {
    id: 69,
    parent_id: 57,
    name: "Apple Accessories",
    description: Faker::Lorem.paragraph
  },
  {
    id: 70,
    parent_id: 57,
    name: "Case & Leather",
    description: Faker::Lorem.paragraph
  },
  {
    id: 71,
    name: "Tools, Industrial & Scientific",
    description: Faker::Lorem.paragraph
  },
  {
    id: 72,
    parent_id: 71,
    name: "Professional Tools",
    description: Faker::Lorem.paragraph
  },
  {
    id: 73,
    parent_id: 71,
    name: "Measurement & Analysis Instruments",
    description: Faker::Lorem.paragraph
  },
  {
    id: 74,
    parent_id: 71,
    name: "Tapes, Adhesives & Sealants",
    description: Faker::Lorem.paragraph
  },
  {
    id: 75,
    parent_id: 71,
    name: "Tool Accessories",
    description: Faker::Lorem.paragraph
  },
  {
    id: 76,
    parent_id: 71,
    name: "Mechanical Parts",
    description: Faker::Lorem.paragraph
  },
  {
    id: 77,
    parent_id: 71,
    name: "Raw Materials",
    description: Faker::Lorem.paragraph
  },
  {
    id: 78,
    parent_id: 71,
    name: "Laser Equipment",
    description: Faker::Lorem.paragraph
  },
  {
    id: 79,
    parent_id: 71,
    name: "Electrical Equipment & Supplies",
    description: Faker::Lorem.paragraph
  },
  {
    id: 80,
    parent_id: 71,
    name: "Power Tools",
    description: Faker::Lorem.paragraph
  },
  {
    id: 81,
    parent_id: 71,
    name: "Lab & Scientific Supplies",
    description: Faker::Lorem.paragraph
  },
  {
    id: 82,
    parent_id: 71,
    name: "Hardware &amp; Accessories",
    description: Faker::Lorem.paragraph
  },
  {
    id: 83,
    parent_id: 71,
    name: "Hand Tools",
    description: Faker::Lorem.paragraph
  },
  {
    id: 84,
    parent_id: 71,
    name: "Fasteners",
    description: Faker::Lorem.paragraph
  },
  {
    id: 85,
    name: "Bags & Shoes",
    description: Faker::Lorem.paragraph
  },
  {
    id: 86,
    parent_id: 85,
    name: "Women's Bags",
    description: Faker::Lorem.paragraph
  },
  {
    id: 87,
    parent_id: 85,
    name: "Women's Shoes",
    description: Faker::Lorem.paragraph
  },
  {
    id: 88,
    parent_id: 85,
    name: "Men's Bags",
    description: Faker::Lorem.paragraph
  },
  {
    id: 89,
    parent_id: 85,
    name: "Men's Shoes",
    description: Faker::Lorem.paragraph
  },
  {
    id: 90,
    parent_id: 85,
    name: "School Bags",
    description: Faker::Lorem.paragraph
  },
  {
    id: 91,
    parent_id: 85,
    name: "Kids Shoes",
    description: Faker::Lorem.paragraph
  },
  {
    id: 92,
    parent_id: 85,
    name: "Kids Bags",
    description: Faker::Lorem.paragraph
  },
  {
    id: 93,
    parent_id: 85,
    name: "Baby Shoes",
    description: Faker::Lorem.paragraph
  },
  {
    id: 94,
    name: "Computer & Networking",
    description: Faker::Lorem.paragraph
  },
  {
    id: 95,
    parent_id: 94,
    name: "Tablet PC",
    description: Faker::Lorem.paragraph
  },
  {
    id: 96,
    parent_id: 94,
    name: "Computer Components",
    description: Faker::Lorem.paragraph
  },
  {
    id: 97,
    parent_id: 94,
    name: "Mini PC & Accessories",
    description: Faker::Lorem.paragraph
  },
  {
    id: 98,
    parent_id: 94,
    name: "Laptops & Accessories",
    description: Faker::Lorem.paragraph
  },
  {
    id: 99,
    parent_id: 94,
    name: "Drives and Storage",
    description: Faker::Lorem.paragraph
  },
  {
    id: 100,
    parent_id: 94,
    name: "Computer Cables & Connectors",
    description: Faker::Lorem.paragraph
  },
  {
    id: 101,
    parent_id: 94,
    name: "Office & School Supplies",
    description: Faker::Lorem.paragraph
  },
  {
    id: 102,
    parent_id: 94,
    name: "Networking",
    description: Faker::Lorem.paragraph
  },
  {
    id: 103,
    parent_id: 94,
    name: "Office Furniture",
    description: Faker::Lorem.paragraph
  },
  {
    id: 104,
    parent_id: 94,
    name: "Computer Peripherals",
    description: Faker::Lorem.paragraph
  },
  {
    id: 105,
    name: "Lights & Lighting",
    description: Faker::Lorem.paragraph
  },
  {
    id: 106,
    parent_id: 105,
    name: "Flashlight",
    description: Faker::Lorem.paragraph
  },
  {
    id: 107,
    parent_id: 105,
    name: "Indoor Lighting",
    description: Faker::Lorem.paragraph
  },
  {
    id: 108,
    parent_id: 105,
    name: "LED Light Bulbs",
    description: Faker::Lorem.paragraph
  },
  {
    id: 109,
    parent_id: 105,
    name: "Outdoor Lighting",
    description: Faker::Lorem.paragraph
  },
  {
    id: 110,
    parent_id: 105,
    name: "Lighting Accessories",
    description: Faker::Lorem.paragraph
  },
  {
    id: 111,
    parent_id: 105,
    name: "LED Strip",
    description: Faker::Lorem.paragraph
  },
  {
    id: 112,
    parent_id: 105,
    name: "Lasers",
    description: Faker::Lorem.paragraph
  },
  {
    id: 113,
    parent_id: 105,
    name: "Holiday Lights",
    description: Faker::Lorem.paragraph
  },
  {
    id: 114,
    name: "Toys Hobbies and Robot",
    description: Faker::Lorem.paragraph
  },
  {
    id: 115,
    parent_id: 114,
    name: "RC Drones",
    description: Faker::Lorem.paragraph
  },
  {
    id: 116,
    parent_id: 114,
    name: "RC Robot",
    description: Faker::Lorem.paragraph
  },
  {
    id: 117,
    parent_id: 114,
    name: "Learning & Education",
    description: Faker::Lorem.paragraph
  },
  {
    id: 118,
    parent_id: 114,
    name: "RC Vehicles",
    description: Faker::Lorem.paragraph
  },
  {
    id: 119,
    parent_id: 114,
    name: "Musical Instruments",
    description: Faker::Lorem.paragraph
  },
  {
    id: 120,
    parent_id: 114,
    name: "Novelty & Gagdet Toys",
    description: Faker::Lorem.paragraph
  },
  {
    id: 121,
    parent_id: 114,
    name: "RC Parts",
    description: Faker::Lorem.paragraph
  },
  {
    id: 122,
    parent_id: 114,
    name: "Dolls & Stuffed Toys",
    description: Faker::Lorem.paragraph
  },
  {
    id: 123,
    parent_id: 114,
    name: "Model & Building Toys",
    description: Faker::Lorem.paragraph
  },
  {
    id: 124,
    name: "Home and Garden",
    description: Faker::Lorem.paragraph
  },
  {
    id: 125,
    parent_id: 124,
    name: "Kitchen, Dining & Bar",
    description: Faker::Lorem.paragraph
  },
  {
    id: 126,
    parent_id: 124,
    name: "Home Textiles",
    description: Faker::Lorem.paragraph
  },
  {
    id: 127,
    parent_id: 124,
    name: "Pet Supplies",
    description: Faker::Lorem.paragraph
  },
  {
    id: 128,
    parent_id: 124,
    name: "Furniture",
    description: Faker::Lorem.paragraph
  },
  {
    id: 129,
    parent_id: 124,
    name: "Home Decor",
    description: Faker::Lorem.paragraph
  },
  {
    id: 130,
    parent_id: 124,
    name: "Baby Kids & Mother Care",
    description: Faker::Lorem.paragraph
  },
  {
    id: 131,
    parent_id: 124,
    name: "Bathroom",
    description: Faker::Lorem.paragraph
  },
  {
    id: 132,
    parent_id: 124,
    name: "Festival Gifts & Party Supplies",
    description: Faker::Lorem.paragraph
  },
  {
    id: 133,
    parent_id: 124,
    name: "Housekeeping & Organization",
    description: Faker::Lorem.paragraph
  },
  {
    id: 134,
    parent_id: 124,
    name: "Gardening",
    description: Faker::Lorem.paragraph
  },
  {
    id: 135,
    parent_id: 124,
    name: "Faucets",
    description: Faker::Lorem.paragraph
  },
  {
    id: 136,
    parent_id: 124,
    name: "Home Cleaner",
    description: Faker::Lorem.paragraph
  },
  {
    id: 137,
    name: "Jewelry and Watch",
    description: Faker::Lorem.paragraph
  },
  {
    id: 138,
    parent_id: 137,
    name: "Men Watches",
    description: Faker::Lorem.paragraph
  },
  {
    id: 139,
    parent_id: 137,
    name: "Men Jewelry",
    description: Faker::Lorem.paragraph
  },
  {
    id: 140,
    parent_id: 137,
    name: "Magnet & Healing Jewelry",
    description: Faker::Lorem.paragraph
  },
  {
    id: 141,
    parent_id: 137,
    name: "Women Watches",
    description: Faker::Lorem.paragraph
  },
  {
    id: 142,
    parent_id: 137,
    name: "Women Jewelry",
    description: Faker::Lorem.paragraph
  },
  {
    id: 143,
    parent_id: 137,
    name: "Keychain & Ornaments",
    description: Faker::Lorem.paragraph
  },
  {
    id: 144,
    parent_id: 137,
    name: "Smart Wearable Device",
    description: Faker::Lorem.paragraph
  },
  {
    id: 145,
    parent_id: 137,
    name: "Fine Jewelry",
    description: Faker::Lorem.paragraph
  },
  {
    id: 146,
    parent_id: 137,
    name: "Kid's Jewelry & DIY",
    description: Faker::Lorem.paragraph
  },
  {
    id: 147,
    parent_id: 137,
    name: "Gym & Hiking Watch",
    description: Faker::Lorem.paragraph
  },
  {
    id: 148,
    parent_id: 137,
    name: "Jewelry Supplies",
    description: Faker::Lorem.paragraph
  },
  {
    id: 149,
    parent_id: 137,
    name: "Watch Accessories",
    description: Faker::Lorem.paragraph
  },
  {
    id: 150,
    parent_id: 137,
    name: "Watch Tools",
    description: Faker::Lorem.paragraph
  },
  {
    id: 151,
    parent_id: 137,
    name: "Sports & Outdoor",
    description: Faker::Lorem.paragraph
  },
  {
    id: 152,
    parent_id: 137,
    name: "Bike & Bicycle",
    description: Faker::Lorem.paragraph
  },
  {
    id: 153,
    parent_id: 137,
    name: "Fitness Wellness",
    description: Faker::Lorem.paragraph
  },
  {
    id: 154,
    parent_id: 137,
    name: "Outdoors Clothing & Shoes",
    description: Faker::Lorem.paragraph
  },
  {
    id: 155,
    parent_id: 137,
    name: "Camping",
    description: Faker::Lorem.paragraph
  },
  {
    id: 156,
    parent_id: 137,
    name: "Outdoor Recreation",
    description: Faker::Lorem.paragraph
  },
  {
    id: 157,
    parent_id: 137,
    name: "Travel Supplies",
    description: Faker::Lorem.paragraph
  },
  {
    id: 158,
    parent_id: 137,
    name: "Fishing & Hunting",
    description: Faker::Lorem.paragraph
  },
  {
    id: 159,
    parent_id: 137,
    name: "Team Sport",
    description: Faker::Lorem.paragraph
  },
  {
    id: 160,
    parent_id: 137,
    name: "Hiking & Climbing",
    description: Faker::Lorem.paragraph
  }
]

categories.each do |params|
  category = Category.new(params)

  if category.save!
    puts "#{category.name} has been saved with id: (#{category.id})"
  else
    puts "Failed to save #{category.name} with errors: (#{category.errors.full_messages})"
  end
end
puts "There are now #{Category.count} rows in the categories table"

# create sample users
1.upto(1000) do |i|
  user = User.new(id: i, email: Faker::Internet.email(separators: i.to_s), password: 'password', password_confirmation: 'password')

  if user.save!
    url = 'https://i.pravatar.cc/300'

    filename = File.basename(URI.parse(url).path)
    file = URI.open(url)

    user.avatar.attach(io: file, filename: filename)
    puts "#{user.email} has been saved with id: (#{user.id})"
  else
    puts "Failed to save user: #{user.email} with errors: (#{user.id})"
  end
end
puts "There are now #{User.count} rows in the users table"