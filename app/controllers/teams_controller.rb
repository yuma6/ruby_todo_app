class TeamsController < ApplicationController
    before_action :authenticate_user!, only:[:team_space, :create, :destroy, :team_in, :team_out]
    before_action :teams_all, only:[:index]
    before_action :set_current_team, only:[:team_space, :destroy, :team_in, :team_out]
    before_action :member_check, only:[:team_space]
    before_action :set_team_member, only:[:team_space]

    def index
    end

    def team_space
    end

    def create
        @team = Team.new(team_name: params[:team_name])
        save_valid_team
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
        @out_user = TeamUser.find_by(team_id: @current_team.id ,user_id: @user.id)
        @out_user.destroy
        flash[:notice]="チームから脱退しました"
        redirect_back(fallback_location: root_path)
    end

    private

    def teams_all
        @teams = Team.all.order(created_at: :desc)
    end

    def set_current_team
        @current_team = Team.find_by(id:params[:id])
    end

    def member_check
        @member_check = TeamUser.find_by(team_id: @current_team&.id ,user_id: @user&.id)
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
        @member_list = TeamUser.where(team_id: @current_team&.id)
    end

end