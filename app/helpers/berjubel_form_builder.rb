# frozen_string_literal: true

# BerjubelFormBuilder
class BerjubelFormBuilder < ActionView::Helpers::FormBuilder
  def action_form_group(method, options = {})
    renderer = options[:renderer] || 'form_builder/action_form_group'
    @template.render renderer, f: self, method: method, options: options
  end

  def alert(type = :danger)
    renderer = options[:renderer] || 'form_builder/alert'
    errors = @object.errors
    keys = errors.attribute_names
    messages = keys.map { |k| [k, errors.full_messages_for(k).join(', ')] }

    @template.render renderer, f: self, type: type, messages: messages if messages.present?
  end

  def check_box_form_group(method, options = {})
    renderer = options[:renderer] || 'form_builder/check_box_form_group'
    options[:class] = 'form-check-input'
    @template.render renderer, f: self, method: method, options: options
  end

  def domain_form_group(method, options = {})
    renderer = options[:renderer] || 'form_builder/domain_form_group'
    options[:class] = "#{options[:class]} #{form_control_class(method)}"
    options[:disabled] = object.persisted?
    @template.render renderer, f: self, method: method, options: options
  end

  def email_form_group(method, options = {})
    renderer = options[:renderer] || 'form_builder/email_form_group'
    @template.render renderer, f: self, method: method, options: options
  end

  def file_form_group(method, options = {})
    renderer = options[:renderer] || 'form_builder/file_form_group'
    @template.render renderer, f: self, method: method, options: options
  end

  def password_form_group(method, options = {})
    renderer = options[:renderer] || 'form_builder/password_form_group'
    @template.render renderer, f: self, method: method, options: options
  end

  def select_form_group(method, choices = [], options = {})
    renderer = options[:renderer] || 'form_builder/select_form_group'
    options[:class] = "#{options[:class]} #{form_control_class(method)}"
    @template.render renderer, f: self, method: method, choices: choices, options: options
  end

  def text_area_form_group(method, options = {})
    renderer = options[:renderer] || 'form_builder/text_area_form_group'
    options[:class] = "#{options[:class]} #{form_control_class(method)}"

    @template.render renderer, f: self, method: method, options: options
  end

  def text_area_with_locales_form_group(method, options = {})
    renderer = options[:renderer] || 'form_builder/text_area_with_locales_form_group'
    options[:class] = "#{options[:class]} #{form_control_class(method)}"

    @template.render renderer, f: self, method: method, options: options
  end

  def text_form_group(method, options = {})
    renderer = options[:renderer] || 'form_builder/text_form_group'
    options[:class] = "#{options[:class]} #{form_control_class(method)}"

    @template.render renderer, f: self, method: method, options: options
  end

  def text_with_locales_form_group(method, options = {})
    renderer = options[:renderer] || 'form_builder/text_with_locales_form_group'
    options[:class] = "#{options[:class]} #{form_control_class(method)}"

    @template.render renderer, f: self, method: method, options: options
  end

  def invalid_feedback(method, options = {})
    renderer = options[:renderer] || 'form_builder/invalid_feedback'
    @template.render renderer, message: @object.errors[method].join(', '), options: options
  end

  def valid_feedback(method, options = {})
    renderer = options[:renderer] || 'form_builder/valid_feedback'
    message = options[:message] || [@object.class.human_attribute_name(method), 'bagus'].join(' ')

    @template.render renderer, message: message, options: options
  end

  private

  def form_control_class(method)
    return 'form-control is-invalid' if @object.errors[method].present?
    return 'form-control is-valid' if @object.errors[method].blank? && @object[method].present?

    'form-control'
  end
end
