require 'faker'

models = if ENV['MODELS'].present?
  ENV['MODELS'].split(',').map(&:to_sym)
else
  [:categories, :users, :stores, :items] #default models
end

# create categories
if models.include?(:categories)
  categories = YAML.load(ERB.new(File.read(File.join(Rails.root, 'test', 'fixtures', 'categories.yml'))).result).map(&:values).flatten

  categories.each do |params|
    category = Category.new(params)

    if category.save!
      puts "#{category.name} has been saved with id: (#{category.id})"
    else
      puts "Failed to save #{category.name} with errors: (#{category.errors.full_messages})"
    end
  end
  puts "There are now #{Category.count} rows in the categories table"
end

# create sample users
if models.include?(:users)
  users = YAML.load(ERB.new(File.read(File.join(Rails.root, 'test', 'fixtures', 'users.yml'))).result).values

  users.each do |params|
    user = User.new(params)

    if user.save!
      url = 'https://i.pravatar.cc/300'

      filename = File.basename(URI.parse(url).path)
      file = URI.open(url)

      user.avatar.attach(io: file, filename: filename)
      puts "#{user.email} has been saved with id: (#{user.id})"
    else
      puts "Failed to save user: #{user.email} with errors: (#{user.errors.full_messages})"
    end
  end
  puts "There are now #{User.count} rows in the users table"
end

# create sample stores
if models.include?(:stores)
  stores = YAML.load(ERB.new(File.read(File.join(Rails.root, 'test', 'fixtures', 'stores.yml'))).result).values

  stores.each do |params|
    store = Store.new(params)

    if store.save!
      puts "#{store.name} has been saved with id: (#{store.id})"
    else
      puts "Failed to save store: #{store.name} with errors: (#{store.errors.full_messages})"
    end
  end
  puts "There are now #{Store.count} rows in the stores table"
end

# create sample items
if models.include?(:items)
	items = YAML.load(ERB.new(File.read(File.join(Rails.root, 'test', 'fixtures', 'items.yml'))).result).values

  items.each do |params|
    item = Item.new(id: params['id'], store_id: params['store_id'], name: params['name'], price: params['price'], stock: params['stock'])

    if item.save!
			item.photos.attach(io: File.open(params['file']), filename: params['filename'])
      puts "#{item.name} has been saved with id: (#{item.id})"
    else
      puts "Failed to save item: #{item.name} with errors: (#{item.errors.full_messages})"
    end
  end

  puts "There are now #{Item.count} rows in the items table"
end
