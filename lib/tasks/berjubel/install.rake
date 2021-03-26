# frozen_string_literal: true

namespace :berjubel do
  desc 'Install berjubel'
  task install: :environment do
    Rake::Task['db:prepare'].invoke
    Rake::Task['berjubel:fixtures'].invoke
  end
end
