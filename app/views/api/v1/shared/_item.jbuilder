# frozen_string_literal: true

json.id item.id
json.name item.name
json.price number_to_currency(item.price)
json.stock number_with_delimiter(item.stock)
json.created_at item.created_at
json.updated_at item.updated_at

json.store do
  json.id item.store.id
  json.name item.store.name
  json.description item.store.description

  json.avatar do
    json.name item.store.avatar.name
    json.url url_for(item.store.avatar.variant(resize_to_limit: [24, 24]))
  end
end

json.photos do
  json.array! item.photos do |photo|
    if photo.variable?
      json.name photo.name
      json.url url_for(photo.variant(resize_to_limit: [800, 400]))
    end
  end
end

json.url item_url(item, format: :json)