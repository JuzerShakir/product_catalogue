module ApplicationHelper
    def link_to_add_fields(name, prod, association)
        # property_assoc = associations.first

        # property_object = prod.object.send(property_assoc).klass.new
        # property_id = property_object.object_id


        # fields = prod.fields_for(property_assoc, property_object, child_index: :property_id) do | builder |
        #     render "property", prod_prop: builder
        # end
        # new_object = prod.object.send(association).klass.new
        # id = new_object.object_id

        # fields = prod.fields_for(association, new_object, child_index: :id) do | builder |
        #     render "property", prod_prop: builder
        # end

        # product_property_assoc = associations.last

        # product_property_object = prod.object.send(product_property_assoc).klass.new
        # product_property_object_id = product_property_object.object_id

        # product_property_fields = prod.fields_for(product_property_assoc, product_property_object, child_index: :product_property_object_id) do | builder |
        #     render "product_property_fields", prod: builder
        # end

        # link_to(name, "#", class: 'add_fields', data: {id: id, fields: fields.gsub("\n", "") } )

    end

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
