
class DesignUrlFormatValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        #value = https://c.files.bbci.co.uk/12A9B/production/_111434467_gettydesigns-1143489763.jpg

        if !is_correct?(value)
            record.errors.add attribute, message: "Format is not of png, jpg, jpeg, gif."
        end
    end

    def is_correct?(design_url)
        end_of_design = design_url.split('.').last
        design_formats = ['jpg', 'jpeg', 'png', 'gif']

        design_formats.include?(end_of_design)
        
        # case end_of_design
        # when 'jpg'
        #     true
        # when 'jpeg'
        #     true
        # when 'png'
        #     true
        # when 'gif'
        #     true
        # else
        #     false            
        # end
    end
end
