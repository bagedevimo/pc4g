# frozen_string_literal: true

class BulmaFormBuilder < ActionView::Helpers::FormBuilder
  alias_method :parent_label, :label

  def label(method, text = nil, options = {}, &block)
    super(method, text, merge_class(options, "label"), &block)
  end

  def text_field(method, options = {})
    div_field do
      (block_given? ? yield : nothing) + div_control do
        super(method, merge_class(options, "input")) + errors(method)
      end
    end
  end

  def text_field_with_label(method, options = {})
    text_field(method, options) do
      label(method)
    end
  end

  def email_field(method, options = {})
    div_field do
      (block_given? ? yield : nothing) + div_control_for_icons do
        super(method, merge_class(options, "input")) + email_icon + errors(method)
      end
    end
  end

  def email_field_with_label(method, options = {})
    email_field(method, options) do
      label(method)
    end
  end

  def password_field(method, options = {})
    div_field do
      (block_given? ? yield : nothing) + div_control_for_icons do
        super(method, merge_class(options, "input")) + password_icon + errors(method)
      end
    end
  end

  def password_field_with_label(method, options = {})
    password_field(method, options) do
      label(method)
    end
  end

  def datetime_field(method, options = {})
    div_field do
      (block_given? ? yield : nothing) + div_control do
        super(method, merge_class(options, "input")) + errors(method)
      end
    end
  end

  def datetime_field_with_label(method, options = {})
    datetime_field(method, options) do
      label(method)
    end
  end

  def select(method, choices = nil, options = {}, html_options = {})
    div_field do
      (block_given? ? yield : nothing) + div_control do
        div_select do
          super
        end + errors(method)
      end
    end
  end

  def select_with_label(method, choices = nil, options = {}, html_options = {})
    select(method, choices, options, html_options) do
      label(method)
    end
  end

  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
    div_field do
      (block_given? ? yield : nothing) + div_control do
        div_select do
          super
        end + errors(method)
      end
    end
  end

  def collection_select_with_label(method, collection, value_method, text_method, options = {}, html_options = {})
    collection_select(method, collection, value_method, text_method, options, html_options) do
      label(method)
    end
  end

  def check_box_with_label(method, options = {}, checked_value = "1", unchecked_value = "0")
    div_field do
      div_control do
        check_box(method, options, checked_value,
          unchecked_value) + parent_label(method, nil, {class: "checkbox m-l-5"})
      end
    end
  end

  def submit(value = nil, options = {})
    super(value, merge_class(options, "button"))
  end

  def submit_primary(value = nil, options = {})
    submit(value, merge_class(options, "is-primary"))
  end

  private

  def merge_class_attribute_value(options, value)
    new_options = options.clone
    new_options[:class] = [value, new_options[:class]].join(" ")
    new_options
  end

  alias_method :merge_class, :merge_class_attribute_value

  def div_control(&block)
    @template.content_tag(:div, class: "control", &block)
  end

  def div_field(&block)
    @template.content_tag(:div, class: "field", &block)
  end

  def div_select(&block)
    @template.content_tag(:div, class: "select", &block)
  end

  def div_control_for_icons(&block)
    @template.content_tag(:div, class: "control has-icons-left", &block)
  end

  def email_icon
    @template.content_tag(:span, class: "icon is-left") do
      @template.content_tag(:i, "", class: "fas fa-envelope")
    end
  end

  def password_icon
    @template.content_tag(:span, class: "icon is-left") do
      @template.content_tag(:i, "", class: "fas fa-lock")
    end
  end

  def nothing
    ActiveSupport::SafeBuffer.new
  end

  def errors(method)
    return nothing if object.errors.none?

    methods = [method]
    methods.push(method.to_s.chomp("_id")) if method.to_s.end_with? "_id"

    @template.content_tag(:p, class: "help is-danger") do
      methods.flat_map { |m| object.errors.full_messages_for(m) }.join(", ")
    end
  end
end
