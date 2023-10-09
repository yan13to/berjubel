# frozen_string_literal: true

namespace :berjubel do
  desc 'Import sample data from fixtures with argument MODELS=categories,users'
  task fixtures: :environment do
    models = ENV['MODELS'].present? ? ENV['MODELS'].split(',').map(&:to_sym) : []

    if models.present?
      load_categories if models.include?(:categories)
      load_users if models.include?(:users)
      load_stores if models.include?(:stores)
      load_items if models.include?(:items)
    else
      puts 'MODELS is not specified by user'
    end
  end
end

def load_categories
  category_path = File.join(Rails.root, 'test', 'fixtures', 'categories.yml')
  category_file = File.read(category_path)
  category_result = ERB.new(category_file).result
  category_params = YAML.safe_load(category_result).map(&:values).flatten

  category_params.each do |params|
    category = Category.where(id: params['id']).first || Category.new

    category.assign_attributes(params)

    if category.save
      ap category.attributes
    else
      ap category.errors.full_messages
    end

    next if category.image.attached?

    url = 'https://picsum.photos/800/600'
    filename = File.basename(URI.parse(url).path)

    begin
      file = URI.open(url)
    rescue OpenURI::HTTPError, SocketError, OpenSSL::SSL::SSLError, Errno::ECONNRESET
      file = nil
      next
    end

    category.image.attach(io: file, filename: filename) if file
  end

  # ActiveRecord::Base.connection.reset_sequence!('categories')

  puts "There are now #{Category.count} rows in the categories table"
end

def load_users
  user_path = File.join(Rails.root, 'test', 'fixtures', 'users.yml')
  user_file = File.read(user_path)
  user_result = ERB.new(user_file).result
  user_params = YAML.safe_load(user_result).values

  user_params.each do |params|
    user = User.where(id: params['id']).first || User.new

    user.assign_attributes(params)
    if user.save
      ap user.attributes
    else
      ap user.errors.full_messages
    end

    next if user.try(:profile).try(:avatar).try(:attached?)

    url = 'https://i.pravatar.cc/300'
    filename = File.basename(URI.parse(url).path)

    begin
      file = URI.open(url)
    rescue OpenURI::HTTPError, SocketError, OpenSSL::SSL::SSLError, Errno::ECONNRESET
      file = nil
      next
    end

    user.build_profile.save unless user.profile
    user.profile.avatar.attach(io: file, filename: filename) if file
  end

  # ActiveRecord::Base.connection.reset_sequence!('users')

  puts "There are now #{User.count} rows in the users table"
end

def load_stores
  store_path = File.join(Rails.root, 'test', 'fixtures', 'stores.yml')
  store_file = File.read(store_path)
  store_result = ERB.new(store_file).result
  store_params = YAML.safe_load(store_result).values

  store_params.each do |params|
    store = Store.where(id: params['id']).first || Store.new

    store.assign_attributes(params)

    if store.save
      ap store.attributes
    else
      ap store.errors.full_messages
    end

    next if store.avatar.attached?

    url = 'https://i.pravatar.cc/300'
    filename = File.basename(URI.parse(url).path)

    begin
      file = URI.open(url)
    rescue OpenURI::HTTPError, SocketError, OpenSSL::SSL::SSLError, Errno::ECONNRESET
      file = nil
      next
    end

    store.avatar.attach(io: file, filename: filename) if file
  end

  # ActiveRecord::Base.connection.reset_sequence!('stores')

  puts "There are now #{Store.count} rows in the stores table"
end

def load_items
  item_path = File.join(Rails.root, 'test', 'fixtures', 'items.yml')
  item_file = File.read(item_path)
  item_result = ERB.new(item_file).result
  item_params = YAML.safe_load(item_result).values

  item_params.each do |params|
    item = Item.where(id: params['id']).first || Item.new

    item.assign_attributes(params)

    if item.save
      ap item.attributes
    else
      ap item.errors.full_messages
    end

    next unless item.photos.blank?

    url = 'https://picsum.photos/800/400'
    num_photos = (1..20).to_a.sample

    1.upto(num_photos) do |i|
      begin
        file = URI.open(url)
      rescue OpenURI::HTTPError, SocketError, OpenSSL::SSL::SSLError, Errno::ECONNRESET
        file = nil
        next
      end

      item.photos.attach(io: file, filename: "photo-item-#{item.id}-#{i}") if file
    end
  end

  # ActiveRecord::Base.connection.reset_sequence!('items')

  puts "There are now #{Item.count} rows in the items table"
end
