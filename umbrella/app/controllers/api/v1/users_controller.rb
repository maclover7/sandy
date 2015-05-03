module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: :update
      
      def create
        @user = User.new(user_params)
        if @user.save(user_params)
           render :json => @user, status: :created
        else
          render :json => {}, status: :unprocessable_entity
        end
      end
      
      def update
        if @user.update(user_params)
           render :json => @user, status: :ok
        else
          render :json => {}, status: :unprocessable_entity
        end
      end
      
      private
        def set_user
          @user = User.find_by(params[:id])
        end
      
        def user_params
          params.require(:user).permit(
            :email, :password, :first_name, :last_name, :address_1, :address_2,
            :address_city, :address_state, :address_zipcode, :phone_number            
            )
        end
    end
  end
end