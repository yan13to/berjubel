# frozen_string_literal: true

# ActivityControl
module ActivityControl
  extend ActiveSupport::Concern

  included do
    scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }

    validates :active, inclusion: { in: [true, false] }
  end

  def toggle_active
    active? ? deactivate : activate
  end

  def activate
    return unless respond_to?(:active)

    self.class.transaction do
      before_activate
      activate_cascade
      update_attribute(:active, true)
    end
  end

  def deactivate
    return unless respond_to?(:active)

    self.class.transaction do
      before_deactivate
      deactivate_cascade

      update_attribute(:active, false)
    end
  end

  def before_activate; end

  def before_deactivate; end

  def activate_cascade; end

  def deactivate_cascade; end
end
