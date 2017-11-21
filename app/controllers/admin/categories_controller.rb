class Admin::CategoriesController < ApplicationController
    layout 'admin'
    before_action :authenticate_user!
    before_action :admin_required

    def index
        @categories = Category.all
        @category_groups = CategoryGroup.all
    end

    def new
        @category = Category.new
        @category_groups = CategoryGroup.all
   # @category_groups = CategoryGroup.all.map { |g| [g.name, g.id] }
    end

    def create
        @category = Category.new(category_params)
        # @category_groups = CategoryGroup.all.map { |g| [g.name, g.id] }
    # @category.category_group_id = params[:category_group_id]
        if @category.save
            redirect_to admin_categories_path
        else
            render :new
        end
    end

    def edit
        @category = Category.find(params[:id])
        # 所屬的大分類
        @category_groups = CategoryGroup.all
        # @category_groups = CategoryGroup.all.map { |g| [g.name, g.id] }
    end

    def update
        @category = Category.find(params[:id])
        # 所屬的大分類
        # @category_groups = CategoryGroup.all.map { |g| [g.name, g.id] }
        # @category.category_group_id = params[:category_group_id]
        if @category.update(category_params)
            redirect_to admin_categories_path
        else
            render :edit
        end
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to admin_categories_path,warning: '你已删除这个分类'
    end

    def admin_required
        redirect_to '/', alert: 'You are not admin.' unless current_user.admin?
    end

    def publish
        @category = Category.find(params[:id])
        @category.publish!
        redirect_to :back
    end
    def hide
        @category = Category.find(params[:id])
        @category.hide!
        redirect_to :back
    end
    private
    def category_params
        params.require(:category).permit(:name, :category_group_id, :is_hidden)
    end

end
