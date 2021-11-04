class TeamsUsersController < ApplicationController
    before_action :authenticate_user!, only:[:create, :destroy]
    before_action :set_current_user, only:[:create, :destroy]
    before_action :set_current_team, only:[:create, :destroy]
    before_action :manager_check, only:[:destroy]
    before_action :is_manager?, only:[:destroy]

    def create
        @team_user = TeamUser.new(team_id: @current_team.id ,user_id: @user.id)
        @team_user.save
        flash[:notice]="チームに参加しました"
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @team_user = TeamUser.find_by(team_id: @current_team.id ,user_id: params[:user_id])
        if is_manager?
            flash[:notice]="チーム管理者は脱退できません"
        elsif @team_user&.destroy
            flash[:notice]="チームから脱退しました"
        else
            flash[:notice]="対象が選択されていません"
        end
        redirect_back(fallback_location: root_path)
    end

end