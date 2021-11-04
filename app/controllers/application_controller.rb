class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  #Cross-Site Request Forgery is a serious vulnerability that stems from the trust that web applications place on the session identification cookies that are being passed between browser and server. 
  
  include SessionsHelper

end
