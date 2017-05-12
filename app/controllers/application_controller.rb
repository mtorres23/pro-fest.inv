class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_client
  before_action :authenticate_user!

def set_client
  client =  Client.first
  @client= Client.find(client.id)
end

end
