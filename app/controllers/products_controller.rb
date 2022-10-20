class ProductsController < ApplicationController
    before_action :authenticate_user!

    def index
        @products = current_user.products.includes(:properties)
    end

    def search
        respond_to do | format |
            format.turbo_stream do
                @products = current_user.products.where("name LIKE ?", "#{params[:query]}%")
                render turbo_stream: turbo_stream.update("search_products",
                                            partial: "products/products_search")
            end
        end
    end

    def new
        @product = Product.new
        @product.product_properties.build.build_property
    end

    def create
        @product = current_user.products.new(product_params)
        if @product.save
            redirect_to root_path, notice: "Success!"
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to root_path, notice: "Updated!"
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def destroy
        Product.find(params[:id]).destroy
        redirect_to root_path
    end

    private
        def product_params
            params.require(:product).permit(:name, :upc, :available_on,
                                        product_properties_attributes: [:id, :value, :_destroy,
                                                                property_attributes: [:id, :name]] )
        end
end