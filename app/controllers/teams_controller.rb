class TeamsController < ApplicationController
    before_action :authenticate_user!, only:[:team_space, :create, :destroy, :team_in, :team_out]
<<<<<<< HEAD
    before_action :set_current_user, only:[:index, :create, :team_space, :team_manager, :team_in, :team_out]
    before_action :teams_all, only:[:index]
    before_action :set_current_team, only:[:team_space, :team_manager, :destroy, :team_in, :team_out, :team_remove, :team_assignment]
    before_action :member_check, only:[:team_space]
    before_action :set_team_member, only:[:team_space]
    before_action :manager_check, only:[:team_space, :team_out, :team_manager]
    before_action :date_time, only:[:team_space]
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
    before_action :deve_user, only:[:team_space, :team_manager]
>>>>>>> add_develop_user

    def index
    end

    def team_space
    end

<<<<<<< HEAD
    def team_manager
    end

    def create
        @team = Team.new(team_name: params[:team_name], manager_id: @user.id)
=======
    def create
        @team = Team.new(team_name: params[:team_name])
>>>>>>> action_name
        save_valid_team
        @team_user = TeamUser.new(team_id: @team.id ,user_id: @user.id)
        @team_user.save
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @current_team.destroy
        flash[:notice]="チームを削除しました"
        redirect_to("/teams/list")
    end

    def team_in
        @in_user = TeamUser.new(team_id: @current_team.id ,user_id: @user.id)
        @in_user.save
        flash[:notice]="チームに参加しました"
        redirect_back(fallback_location: root_path)
    end

    def team_out
        if @manager_check
            flash[:alert]="チームの管理ユーザーは脱退できません"
        else
            @out_user = TeamUser.find_by(team_id: @current_team.id ,user_id: @user.id)
            @out_user.destroy
            flash[:notice]="チームから脱退しました"
        end
        redirect_back(fallback_location: root_path)
    end

    def team_remove
        @remove_user = TeamUser.find_by(team_id: @current_team.id ,user_id: params[:user_id])
        if @management
            flash[:notice]="チーム管理者は除外できません"
        elsif @remove_user&.destroy
            flash[:notice]="チーム参加者を除外しました"
        else
            flash[:notice]="対象が選択されていません"
        end
        redirect_back(fallback_location: root_path)
    end

    def team_assignment
<<<<<<< HEAD
        @current_team.manager_id = params[:user_id]
        @current_team.save
        flash[:notice]="チーム管理者を変更しました"
        redirect_to("/teams/#{@current_team.id}/space")
=======
        if @management
            flash[:notice]="自分を選択しています"
            redirect_back(fallback_location: root_path)
        elsif params[:user_id].present?
            @current_team.manager_id = params[:user_id]
            @current_team.save
            flash[:notice]="チーム管理者を変更しました"
            redirect_to("/teams/#{@current_team.id}/space")
        else
            flash[:notice]="変更先ユーザーが選択されませんでした"
            redirect_back(fallback_location: root_path)
        end
>>>>>>> team_maneger_アクション改善
    end

    private

    def teams_all
        @teams = Team.all.order(created_at: :desc)
    end

    def set_current_team
        @current_team = Team.find_by(id:params[:id])
    end

    def member_check
        @member_check = TeamUser.find_by(team_id: @current_team.id ,user_id: @user.id)
    end

    def save_valid_team
        if @team.valid?(:create)
            @team.save
            flash[:notice]="チームを作成しました"
        else
            flash[:alert]="#{@team.errors.full_messages}"
        end
    end

    def set_team_member
        @member_list = TeamUser.where(team_id: @current_team.id)
    end

    def manager_check
        @manager_check = Team.find_by(id: @current_team.id ,manager_id: @user.id)
    end

    def management
        @management = @current_team.manager_id == params[:user_id].to_i
    end

end