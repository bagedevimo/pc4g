# frozen_string_literal: true

ActionView::Base.field_error_proc = proc do |html_tag, _instance|
  html_tag.gsub(/class="(.*?)"/, 'class="\1 is-danger"').html_safe
end
