module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      prepend_before_filter :require_no_authentication, :only => [:create]
      
      def create
        @user = User.new(user_params)
        if @user.save(user_params)
           render :json => @user, status: :created
        else
          render :json => {}, status: :unprocessable_entity
        end
      end
      
      private
        def user_params
          params.require(:user).permit(:email, :password)
        end
    end
    
    class UsersController < ApplicationController
      before_action :set_user
      
      def update
        if @user.update(user_params)
           render :json => @user, status: :ok
        else
          render :json => {}, status: :unprocessable_entity
        end
      end
      
      private
        def set_user
          @user = User.find_by_id(params[:user_id])
        end
      
        def user_params
          params.require(:user).permit(:email, :password)
        end
    end
  end
end