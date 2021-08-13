class SessionsController < ApplicationController

    def uniqueId
        if !session[:uniqueId]
            test
        end
        logger.debug('uniqueId:' + session[:uniqueId])
        render json: session[:uniqueId]
    end

    def login
        @user = User.find_by(email: session_params[:email])

        if @user && @user.authenticate(session_params[:password])
            login!
            render json: { logged_in: true, message: 'ログインしました。' }
        else
            render json: { logged_in: false, message: 'ログインに失敗しました。正しいメールアドレス・パスワードを入力し直すか、新規登録を行ってください。' }
        end
    end

    def logout
        if session[:user_id]
            session.delete(:user_id)
            render json: { logged_out: true, message: 'ログアウトしました。'}
        else
            render json: { logged_out: false, message: 'ログインしていません。'}
        end
        
    end

    def logged_in?
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        if @current_user
            render json: { logged_in: true, user: @current_user }
        else
            render json: { logged_in: false, message: 'ユーザーが存在しません。' }
        end
    end

    private

        def session_params
            params.require(:user).permit(:username, :email, :password)
        end

end