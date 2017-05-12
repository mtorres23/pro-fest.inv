class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :set_client
 

def set_client
  client =  Client.first
  @client= Client.find(client.id)
end

end
