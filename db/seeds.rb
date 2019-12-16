require 'faker'

#ActiveRecord::Base.connection.tables.each do |t|
#  ActiveRecord::Base.connection.reset_pk_sequence!(t)
#end

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
    item = Item.where(id: params['id']).try(:first)
    item = Item.new(id: params['id'], store_id: params['store_id'], name: params['name'], price: params['price'], stock: params['stock']) unless item.present?

    if item.save! && item.new_record?
      url = 'https://picsum.photos/800/400'

      num_photos = (1..20).to_a.sample

      1.upto(num_photos) do |i|
        i += 1
        file = URI.open(url)
        item.photos.attach(io: file, filename: "photo-item-#{item.id}-#{i}")
      end

      puts "#{item.name} has been saved with id: (#{item.id})"
    elsif item.errors.full_messages.present?
      puts "Failed to save item: #{item.name} with errors: (#{item.errors.full_messages})"
    else
      puts item.name
    end
  end

  puts "There are now #{Item.count} rows in the items table"
end
