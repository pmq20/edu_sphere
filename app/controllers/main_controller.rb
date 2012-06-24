class MainController < ApplicationController
  def index
  	if logged_in?
  		render :action=>'user'
  	else
  		render :action=>'guest'
  	end
  end
end
