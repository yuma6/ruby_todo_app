class ApplicationController < ActionController::Base
    before_action :set_current_user, only:[:index, :edit, :show, :create, :update, :index, :team_space, :team_in, :team_out]
    before_action :date_time, only:[:index, :edit, :show, :create, :team_space]

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
