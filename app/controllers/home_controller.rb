# frozen_string_literal: true
class HomeController < ApplicationController
  def index
    @next_pc4g = Contest.starts_in_future.order(starts_at: :asc).first
  end
end
