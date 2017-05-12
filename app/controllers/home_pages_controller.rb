class HomePagesController < ApplicationController
  before_action :authenticate_user!, only: [:faqs]
  
  def home
  end

  def about
  end

  def faqs
  end
end
