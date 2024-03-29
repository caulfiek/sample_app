class UsersController < ApplicationController
    before_filter :authenticate, :only => [:index, :edit, :update]
    before_filter :correct_user, :only => [:edit, :update]
  
    def show
        #@user = User.find(params[:id])
        @user = User.find(params[:id])
        @title = @user.name
    end
    
    def index
        @title = "All users"
        @users = User.all
    end
  
    def new
        @user = User.new
        @title = "Sign up"
    end
    
    def create
        @user = User.new(params[:user]) 
        if @user.save
            sign_in @user
            redirect_to @user, :flash => { :success => "Welcome to the Sample App!" }
        else
            @title = "Sign up"
            render 'new'
        end 
    end
    
    def edit
        @title = "Edit user"
    end
    
    def update
        if @user.update_attributes(params[:user])
            redirect_to @user, :flash => { :success => "Profile updated." }
            else
            @title = "Edit user"
            render 'edit'
        end 
    end
    
    
    
    private
    
        def authenticate
            deny_access unless signed_in?
        end
    
        def correct_user # see before_filter
            @user = User.find(params[:id]) 
            redirect_to(root_path) unless current_user?(@user)
        end

end
