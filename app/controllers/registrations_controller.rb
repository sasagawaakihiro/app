class RegistrationsController < ApplicationController

    def signup
        @user = User.new(registrations_params)

        if @user.save
            render json: { status: :created, message: 'ユーザの登録に成功しました。' }
        else
            render json: { status: 500, message: 'ユーザの登録に失敗しました。メールアドレスまたはパスワードを確認してください。' }
        end
    end

    private

        def registrations_params
            params.require(:user).permit(:email, :password, :password_confirmation)
        end

end