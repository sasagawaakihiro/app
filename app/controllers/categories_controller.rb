class CategoriesController < ApplicationController
    def index
        @categories = Category.all
        render json: @categories
    end

    def listAndCount
        @categories = Category.all.left_joins(:post_contents).group(:id).select('categories.*, COUNT(`post_contents`.`id`) AS contents_count')
        render json: @categories
    end

    def create
        @category = Category.create(name: params[:name])
        @categories = Category.all.left_joins(:post_contents).group(:id).select('categories.*, COUNT(`post_contents`.`id`) AS contents_count')
        render json: @categories
      end

      def update
        @category = Category.find(params[:id])
        @category.update(name: params[:name])
        render json: @category
      end

    def destroy
        @category = Category.find(params[:id])
        if @category.destroy
          head :no_content, status: :ok
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end
end
