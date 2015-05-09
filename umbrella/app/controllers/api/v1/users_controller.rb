module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, :only => [:update, :reset_password]
      
      def create
        @user = User.new(user_params)
        if @user.save(user_params)
           render json: @user, status: :created
        else
          render json: {}, status: :unprocessable_entity
        end
      end
      
      def update
        if @user.update(user_params)
           render json: @user, status: :ok
        else
          render json: {}, status: :unprocessable_entity
        end
      end
      
      def reset_password
         @user.send_password_reset
         render json: {}, status: :created
      end
      
      def update_password
        @user = User.find_by(user_params)
          
        if @user.password_reset_sent_at.to_s < 2.hours.ago.to_s
          render json: {}, status: :unprocessable_entity
          #redirect_to new_password_reset_path, :alert => "Password &crarr; reset has expired."
        elsif @user.update_attributes(params[:user])
          render json: {}, status: :ok
          #redirect_to root_url, :notice => "Password has been reset."
        else
          render json: {}, status: :created
          #render :edit
        end
          
      end
      
      private
        def set_user
          @user = User.find_by(params[:id])
        end
      
        def password_params
          params.require(:user).permit(:password, :password_reset_token)
        end
      
        def user_params
          params.require(:user).permit(
            :email, :password, :password_reset_token, :first_name, :last_name, :address_1,
            :address_2, :address_city, :address_state, :address_zipcode, :phone_number            
            )
        end
    end
  end
end