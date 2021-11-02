class ApplicationController < ActionController::Base

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
