class ApplicationController < ActionController::Base
<<<<<<< HEAD
<<<<<<< HEAD
=======
    before_action :set_current_user, only:[:index, :edit, :show, :create, :update, :destroy, :index, :team_space, :team_in, :team_out]
>>>>>>> action_name
=======
    before_action :set_current_user, only:[:index, :edit, :show, :create, :update, :destroy, :team_space, :team_in, :team_out]
>>>>>>> indexの重複を削除

    private
  
      def beginning_of_week
        Date.beginning_of_week = :sunday
      end

      def set_current_user
        @user = current_user
      end

      def date_time
        @date = Date.today
      end

      def deve_user
        @deve_user = current_user.deve_user
      end
  
end
