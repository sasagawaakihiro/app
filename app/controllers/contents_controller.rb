class ContentsController < ApplicationController

    def getList
      logger.debug(session[:user_id])
      logger.debug(session[:uniqueId])
      if session[:user_id]
        logger.debug('全件取得')
        @postContents = PostContent.where(category_id: params[:category_id])
      else
        logger.debug('条件で取得')
        @postContents = PostContent.where(category_id: params[:category_id]).where.not(is_hide: true)
      end
      render json: @postContents
    end

    def create
      c = params.require(:postContent).permit(:name, :email, :subject, :body, :category_id)
      @postContent = PostContent.create(c)
      @postContent.update(hide_user_id: session[:uniqueId])
      render json: @postContent
    end

    def update
      @postContent = PostContent.find(params[:id])
      @postContent.update(is_hide: params[:is_hide])
      render json: @postContent
    end

end
