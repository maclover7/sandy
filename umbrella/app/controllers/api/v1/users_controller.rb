module Api
  module V1
    class UsersController < ApplicationController
      
      def create
        #@user = User.new(user_params)
        #if @user.save(user_params)
        #   render :json => @user, status: :created
        #else
        #  render :json => {}, status: :unprocessable_entity
        #end
      end
      
      private
        #def user_params
        #  params.require(:user).permit(:email, :password)
        #end
    end
  end
end