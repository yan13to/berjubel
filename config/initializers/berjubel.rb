# frozen_string_literal: true

Rails.application.config.x.app_name = 'Berjubel'
Rails.application.config.x.host_name = Rails.env.development? ? 'localhost:3000' : 'berjubel.herokuapp.com'

Rails.application.config.i18n.available_locales = %I[en id]
Rails.application.config.active_storage.variant_processor = :vips
