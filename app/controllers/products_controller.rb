class ProductsController < ApplicationController
    before_action :validate_search_key, only: [:search]
    def index
        @category_groups = CategoryGroup.published
         # 判斷是否篩選分類
        if params[:category].present?
            @category_s = params[:category]
            @category = Category.find_by(name: @category_s)

            @products = Product.where(:category => @category.id).published.recent.paginate(:page => params[:page], :per_page => 12)
        elsif params[:group].present?
            @group_s = params[:group]
            @group = CategoryGroup.find_by(name: @group_s)

            @products = Product.joins(:category).where("categories.category_group_id" => @group.id).published.recent.paginate(:page => params[:page], :per_page => 12)
        else
          @products = Product.published.recent.paginate(:page => params[:page], :per_page => 12)
        end
    end

    def show
        @product = Product.find(params[:id])
        @category_groups = CategoryGroup.published
        set_page_title       @product.title
        set_page_description @product.description
        set_page_keywords    @product.title
        set_page_image       @product_images.first.image.main.url
    end

    def search
        if @query_string.present?
        # 顯示符合條件的商品
        search_result = Product.ransack(@search_criteria).result(:distinct => true)
        @products = search_result.paginate(:page => params[:page], :per_page => 12 )
        @category_groups = CategoryGroup.published
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
