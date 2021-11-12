class ApplicationController < ActionController::Base
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    before_action :set_current_user, only:[:index, :edit, :show, :create, :update, :destroy, :index, :team_space, :team_in, :team_out]
>>>>>>> action_name
=======
    before_action :set_current_user, only:[:index, :edit, :show, :create, :update, :destroy, :team_space, :team_in, :team_out]
>>>>>>> indexの重複を削除

=======
=======
  before_action :configure_permitted_parameters, if: :devise_controller?
>>>>>>> name_input
  before_action :authenticate_user!,except:[:sign_in, :sign_up]
  before_action :set_current_user,only:[:deve_user]
>>>>>>> header&authenticate
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
        @deve_user = @user.deve_user
      end
      
      def set_current_team
        @current_team = Team.find_by(id:params[:id])
      end

      def manager_check
          @manager_check = Team.find_by(id: @current_team.id ,manager_id: @user.id)
      end

      def is_manager?
          @current_team.manager_id == params[:user_id].to_i
      end

      def tasks_all
        @tasks = Task.all.order(created_at: :desc)
      end

    protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      end
  
end
