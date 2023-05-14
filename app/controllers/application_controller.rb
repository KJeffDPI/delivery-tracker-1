class ApplicationController < ActionController::Base
  before_action(:load_current_user)
  
  # Uncomment line 5 in this file and line 3 in UserAuthenticationController if you want to force users to sign in before any other actions.
  before_action(:force_user_sign_in)

  def show
      # find the user by ID
      user = User.find_by(id: params[:user_id])

      # check if the user exists
      if user.nil?
        # render a 404 error page
        render file: "#{Rails.root}/public/404.html", layout: false, status: 404
      else
        # find the post by ID for the given user
        post = user.posts.find_by(id: params[:id])

        # check if the post exists
        if post.nil?
          # render a 404 error page
          render file: "#{Rails.root}/public/404.html", layout: false, status: 404
        else
          # display the post's title and content
          @post = post
          render :show
        end
      end
    end
  end
  
  def load_current_user
    the_id = session[:user_id]
    
    @current_user = User.where({ :id => the_id }).first
  end
  
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    end
  end

#end
