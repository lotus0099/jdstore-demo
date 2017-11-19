class ProductsController < ApplicationController
    before_action :validate_search_key, only: [:search]
    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])

    end

    def search
        if @query_string.present?
        # 顯示符合條件的商品
        search_result = Product.ransack(@search_criteria).result(:distinct => true)
        @products = search_result.paginate(:page => params[:page], :per_page => 12 )
        end
    end


    def add_to_cart
        @product = Product.find(params[:id])
        if !current_cart.products.include?(@product)
            current_cart.add_product_to_cart(@product)
            flash[:notice] = '成功加入购物车'
        else
            flash[:warning] = "你的购物车内已有此物品"
        end
        redirect_to :back
    end

    protected

  def validate_search_key
    # 去除特殊字符

    @query_string = params[:keyword].gsub(/\\|\'|\/|\?/, "") if params[:keyword].present?
    @search_criteria = search_criteria(@query_string)

  end

  def search_criteria(query_string)
    # 篩選多個欄位
    { title_or_description_cont: query_string}
  end


end
