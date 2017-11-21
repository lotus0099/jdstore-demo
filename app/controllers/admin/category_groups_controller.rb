class Admin::CategoryGroupsController < ApplicationController
    # 使用者必須登入
    before_action :authenticate_user!
    # 使用者必須是 admin 身份
    before_action :admin_required
    # 後台頁面排版
    layout "admin"

    def show
        @category_group = CategoryGroup.find(params[:id])
    end
    def new
        @category_group = CategoryGroup.new
    end
    def create
        @category_group = CategoryGroup.new(category_group_params)
        if @category_group.save
            redirect_to admin_category_groups_path
        else
            render :new
        end
    end
    def edit
        @category_group = CategoryGroup.find(params[:id])
    end
    def update
        @category_group = CategoryGroup.find(params[:id])
        if @category_group.update(category_group_params)
            redirect_to admin_category_groups_path
        else
            render :new
        end
    end
    def publish
        @category_group = CategoryGroup.find(params[:id])
        @category_group.publish!
        redirect_to :back
    end
    def hide
        @category_group = CategoryGroup.find(params[:id])
        @category_group.hide!
        redirect_to :back
    end
    def admin_required
        redirect_to '/', alert: 'You are not admin.' unless current_user.admin?
    end
    private
    def category_group_params
    params.require(:category_group).permit(:name, :is_hidden, :description, :logo, :image)
    end

end
