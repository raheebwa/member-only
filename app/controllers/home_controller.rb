# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @signed_in = current_user.present?
  end
end
