class ApplicationController < ActionController::Base
    
  layout :layout_by_resource
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
	  about_path
  end

  def layout_by_resource
    if (params[:controller] == "pages" or params[:controller] == "comments" or params[:controller] == "posts")
      "site"
    else
      "application"
    end
  end


end
