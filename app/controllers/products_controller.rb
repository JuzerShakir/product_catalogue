class ProductsController < ApplicationController
    before_action :authenticate_user!

    def index
        if params[:query].present?
            @products = current_user.products.includes(:properties).where("name LIKE ?", "#{params[:query]}%")
        else
            @products = current_user.products.includes(:properties)
        end
    end

    def new
        @product = Product.new
        @product.product_properties.build.build_property
    end

    def create
        @product = current_user.products.new(product_params)
        begin
            if @product.save
                redirect_to root_path, notice: "Success!"
            else
                render 'new', status: :unprocessable_entity
            end
        rescue ActiveRecord::RecordNotUnique
            @product.errors.add(:product_properties_property_name, "has already been taken")
            render 'new', status: :unprocessable_entity
        end
    end

    private
        def product_params
            params.require(:product).permit(:name, :upc, :available_on,
                                        product_properties_attributes: [:id, :value,
                                                                        property_attributes: [:id, :name]] )
        end
end