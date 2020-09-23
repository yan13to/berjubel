require 'faker'

models = if ENV['MODELS'].present?
           ENV['MODELS'].split(',').map(&:to_sym)
         else
           [:categories, :users, :stores, :items] #default models
         end

# create categories
if models.include?(:categories)
  categories = YAML.safe_load(ERB.new(File.read(File.join(Rails.root, 'test', 'fixtures', 'categories.yml'))).result).map(&:values).flatten

  categories.each do |params|
    Category.where(id: params['id']).first_or_create!(params)
  end

  puts "There are now #{Category.count} rows in the categories table"
end

# create sample users
if models.include?(:users)
  users = YAML.safe_load(ERB.new(File.read(File.join(Rails.root, 'test', 'fixtures', 'users.yml'))).result).values

  users.each do |params|
    user = User.where(id: params['id']).first_or_create!(params)

    unless user.avatar.attached?
      url = 'https://i.pravatar.cc/300'

      filename = File.basename(URI.parse(url).path)
      file = URI.open(url)

      user.avatar.attach(io: file, filename: filename)
    end
  end

  puts "There are now #{User.count} rows in the users table"
end

# create sample stores
if models.include?(:stores)
  stores = YAML.safe_load(ERB.new(File.read(File.join(Rails.root, 'test', 'fixtures', 'stores.yml'))).result).values

  stores.each do |params|
    store = Store.where(id: params['id']).first_or_create!(params)

    unless store.avatar.attached?
      url = 'https://i.pravatar.cc/300'

      filename = File.basename(URI.parse(url).path)
      file = URI.open(url)

      store.avatar.attach(io: file, filename: filename)
      puts "#{store.name} has been saved with id: (#{store.id})"
    end
  end

  puts "There are now #{Store.count} rows in the stores table"
end

# create sample items
if models.include?(:items)
  items = YAML.safe_load(ERB.new(File.read(File.join(Rails.root, 'test', 'fixtures', 'items.yml'))).result).values

  items.each do |params|
    item = Item.where(id: params['id']).first_or_create!(params)

    if item.photos.blank?
      url = 'https://picsum.photos/800/400'

      num_photos = (1..20).to_a.sample

      1.upto(num_photos) do |i|
        i += 1
        file = URI.open(url)
        item.photos.attach(io: file, filename: "photo-item-#{item.id}-#{i}")
      end

      puts "#{item.name} has been saved with id: (#{item.id})"
    end
  end

  puts "There are now #{Item.count} rows in the items table"
end
