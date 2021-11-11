class UsersController < ApplicationController
    before_action :set_current_user,only:[:name]

    def name
        @user.name = params[:name]
        if @user.name.present?
          @user.save
          flash[:notice]="ユーザー名を設定しました"
        else
          flash[:alert]="ユーザー名が入力されていません"
        end
        redirect_back(fallback_location: root_path)
    end

end