# frozen_string_literal: true

json.array! @photos do |photo|
  json.partial! 'api/v1/shared/photo', photo: photo
end
