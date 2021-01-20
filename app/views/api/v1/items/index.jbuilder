# frozen_string_literal: true

json.array! @items do |item|
  json.partial! 'api/v1/shared/item', item: item
end
