module ApplicationHelper
    def properties_listing_of product
        prod_value = product.product_properties.pluck(:value)
        prod_name = product.properties.pluck(:name)
        properties = prod_name.zip(prod_value)

        output = ""
        properties.each do | property |
            output << property.join(':') << ", "
        end
        output.delete_suffix(', ')
    end
end
