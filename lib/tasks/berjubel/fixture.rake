# frozen_string_literal: true

namespace :berjubel do
  desc 'Import sample data from fixtures'
  task fixtures: :environment do
    models = ENV['MODELS'].present? ? ENV['MODELS'].split(',').map(&:to_sym) : []

    if models.present?
      load_categories if models.include?(:categories)
      load_users if models.include?(:users)
      load_stores if models.include?(:stores)
      load_items if models.include?(:items)
    end
  end
end

def load_categories
  categories = YAML.safe_load(ERB.new(File.read(File.join(Rails.root, 'test', 'fixtures', 'categories.yml'))).result).map(&:values).flatten

  categories.each do |params|
    params['name'] = { en: params['name'], id: params['name'] }
    params['description'] = { en: params['description'], id: params['description'] }
    Category.where(id: params['id']).first_or_create!(params)
  end

  ActiveRecord::Base.connection.reset_pk_sequence!('categories')

  puts "There are now #{Category.count} rows in the categories table"
end

def load_users
  users = YAML.safe_load(ERB.new(File.read(File.join(Rails.root, 'test', 'fixtures', 'users.yml'))).result).values

  users.each do |params|
    user = User.where(id: params['id']).first_or_create!(params)
    ap user.attributes

    next if user.try(:profile).try(:avatar).try(:attached?)

    url = 'https://i.pravatar.cc/300'
    filename = File.basename(URI.parse(url).path)

    begin
      file = URI.open(url)
    rescue OpenURI::HTTPError, SocketError
      file = nil
      next
    end

    user.build_profile.save unless user.profile
    user.profile.avatar.attach(io: file, filename: filename) if file
  end

  ActiveRecord::Base.connection.reset_pk_sequence!('users')

  puts "There are now #{User.count} rows in the users table"
end

def load_stores
  stores = YAML.safe_load(ERB.new(File.read(File.join(Rails.root, 'test', 'fixtures', 'stores.yml'))).result).values

  stores.each do |params|
    store = Store.where(id: params['id']).first_or_create!(params)

    next if store.avatar.attached?

    url = 'https://i.pravatar.cc/300'
    filename = File.basename(URI.parse(url).path)

    begin
      file = URI.open(url)
    rescue OpenURI::HTTPError, SocketError
      file = nil
      next
    end

    store.avatar.attach(io: file, filename: filename) if file
  end

  ActiveRecord::Base.connection.reset_pk_sequence!('stores')

  puts "There are now #{Store.count} rows in the stores table"
end

def load_items
  items = YAML.safe_load(ERB.new(File.read(File.join(Rails.root, 'test', 'fixtures', 'items.yml'))).result).values

  items.each do |params|
    item = Item.where(id: params['id']).first_or_create!(params)
    next unless item.photos.blank?

    url = 'https://picsum.photos/800/400'
    num_photos = (1..20).to_a.sample

    1.upto(num_photos) do |i|
      begin
        file = URI.open(url)
      rescue OpenURI::HTTPError, SocketError
        file = nil
        next
      end

      item.photos.attach(io: file, filename: "photo-item-#{item.id}-#{i}") if file
    end
  end

  ActiveRecord::Base.connection.reset_pk_sequence!('items')

  puts "There are now #{Item.count} rows in the items table"
end
