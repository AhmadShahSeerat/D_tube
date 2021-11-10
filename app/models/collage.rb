class Collage < ApplicationRecord
    validates :name, presence: true
    has_many :designs
    accepts_nested_attributes_for :designs, reject_if: proc { |attributes| attributes['title'].blank? }

    # def designs_attributes=(attributes) #to add diff designs into one collage
    #     if !(attributes[:title].blank? || attributes[:description].blank? | attributes[:design_url].blank?)
    #         self.design = Design.find_or_create_by(attributes)
    #     end
    # end
end

