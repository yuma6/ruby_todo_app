class ApplicationController < ActionController::Base
    before_action :set_current_user, only:[:index, :edit, :show, :create, :update, :destroy, :index, :team_space, :team_in, :team_out]

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
  
end
