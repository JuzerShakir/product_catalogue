class ProductsController < ApplicationController
    before_action :authenticate_user!, only: [:new]

    def index
        @products = current_user.products
    end

    def new
        @product = Product.new
        # @property = Property.new
        @product.properties.build
        @product.product_properties.build
    end

    def create
        @product = current_user.products.new(product_params)
        if @product.valid?
            @product.save
            redirect_to products_path, notice: "Success!"
        else
            render 'new', status: :unprocessable_entity
        end
    end

    private
        def product_params
            params.require(:product).permit(:name, :upc, :available_on,
                                        properties_attributes: [:name], product_properties_attributes: [:value] )
        end
end