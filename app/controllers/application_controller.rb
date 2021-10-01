class ApplicationController < ActionController::Base
    before_action :beginning_of_week

    private
  
      def beginning_of_week
        Date.beginning_of_week = :sunday
      end
  
end
