class TeamsController < ApplicationController
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    before_action :authenticate_user!, only:[:team_space, :create, :destroy, :team_in, :team_out]
<<<<<<< HEAD
    before_action :set_current_user, only:[:index, :create, :team_space, :team_manager, :team_in, :team_out]
=======
    before_action :authenticate_user!, only:[:team_space, :create, :destroy]
=======
>>>>>>> header&authenticate
    before_action :set_current_user, only:[:index, :create, :team_space, :team_manager]
>>>>>>> team_user_controller
=======
    before_action :set_current_user, only:[:index, :create, :team_space, :team_manager]
>>>>>>> 58a9e496030d5092d56c8fc588feab0e328666ba
    before_action :teams_all, only:[:index]
    before_action :set_current_team, only:[:team_space, :team_manager, :destroy, :team_assignment]
    before_action :member_check, only:[:team_space]
    before_action :set_team_member, only:[:team_space]
    before_action :manager_check, only:[:team_space, :team_manager]
    before_action :date_time, only:[:team_space]
<<<<<<< HEAD
<<<<<<< HEAD
    before_action :management, only:[:team_remove, :team_assignment]
<<<<<<< HEAD
=======
    before_action :teams_all, only:[:index]
    before_action :set_current_team, only:[:team_space, :destroy, :team_in, :team_out]
    before_action :member_check, only:[:team_space]
    before_action :set_team_member, only:[:team_space]
    before_action :date_time, only:[:team_space]
>>>>>>> action_name
=======
=======
    before_action :is_manager?, only:[:team_assignment]
>>>>>>> team_user_controller
    before_action :deve_user, only:[:team_space, :team_manager]
<<<<<<< HEAD
>>>>>>> add_develop_user
=======
    before_action :tasks_all, only:[:team_space]
<<<<<<< HEAD
>>>>>>> calendar_switch
=======
    before_action :set_manager_name, only:[:team_space]
>>>>>>> name js
=======
    before_action :is_manager?, only:[:team_assignment]
    before_action :deve_user, only:[:team_space, :team_manager]
    before_action :tasks_all, only:[:team_space]
    before_action :set_manager_name, only:[:team_space]
>>>>>>> 58a9e496030d5092d56c8fc588feab0e328666ba

    def index
    end

    def team_space
    end

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 58a9e496030d5092d56c8fc588feab0e328666ba
    def team_manager
    end

    def create
        @team = Team.new(team_name: params[:team_name], manager_id: @user.id)
<<<<<<< HEAD
=======
    def create
        @team = Team.new(team_name: params[:team_name])
>>>>>>> action_name
=======
>>>>>>> 58a9e496030d5092d56c8fc588feab0e328666ba
        save_valid_team
        @team_user = TeamUser.new(team_id: @team.id ,user_id: @user.id)
        @team_user.save
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @current_team.destroy
        flash[:notice]="??????????????????????????????"
        redirect_to("/teams/list")
    end

    def team_assignment
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        @current_team.manager_id = params[:user_id]
        @current_team.save
        flash[:notice]="???????????????????????????????????????"
        redirect_to("/teams/#{@current_team.id}/space")
=======
        if @management
=======
        if is_manager?
>>>>>>> team_user_controller
=======
        if is_manager?
>>>>>>> 58a9e496030d5092d56c8fc588feab0e328666ba
            flash[:notice]="??????????????????????????????"
            redirect_back(fallback_location: root_path)
        elsif params[:user_id].present?
            @current_team.manager_id = params[:user_id]
            @current_team.save
            flash[:notice]="???????????????????????????????????????"
            redirect_to("/teams/#{@current_team.id}/space")
        else
            flash[:notice]="??????????????????????????????????????????????????????"
            redirect_back(fallback_location: root_path)
        end
<<<<<<< HEAD
>>>>>>> team_maneger_?????????????????????
=======
>>>>>>> 58a9e496030d5092d56c8fc588feab0e328666ba
    end

    private

    def teams_all
        @teams = Team.all.order(created_at: :desc)
    end

    def member_check
        @member_check = TeamUser.find_by(team_id: @current_team.id ,user_id: @user.id)
    end

    def save_valid_team
        if @team.valid?(:create)
            @team.save
            flash[:notice]="??????????????????????????????"
        else
            flash[:alert]="#{@team.errors.full_messages}"
        end
    end

    def set_team_member
        @member_list = TeamUser.where(team_id: @current_team.id)
    end

    def set_manager_name
        @manager_name = User.find_by(id:@current_team.manager_id).name
    end

end