class HomePagesController < ApplicationController
  before_action :authenticate_user!, only: [:home]

  def home
    @nomodal = true
  end

  def about
  end

  def faqs
  end
end
