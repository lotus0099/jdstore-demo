class Admin::ProductsController < ApplicationController
    layout "admin"
    before_action :authenticate_user!, only: %i[new edit update detroy]
    before_action :admin_required

    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to admin_products_path
        else
            render :new
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to admin_products_path
        else
            render :new
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to admin_products_path
    end

    def admin_required
        redirect_to '/', alert: 'You are not admin.' unless current_user.admin?
end

    private

    def product_params
        params.require(:product).permit(:title, :description, :price, :quantity,:image)
    end
end
