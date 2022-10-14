class CustomLengthValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        unless value.match?(/^\d{12,13}$|^\d{10}$/)
            record.errors.add(attribute, "length is not within range")
        end
    end
end