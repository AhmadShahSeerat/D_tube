class Design < ApplicationRecord 
    belongs_to :collage, optional: true
    validates :title, presence: true, uniqueness: true
    # validates :title, presence: true, uniqueness: {scope: :design_url, message: 'Title and Design_Url are not Unique'}
    validates :description, presence: true
    validates :design_url, presence: true, design_url_format: {on: :create}
    
# on is when we want this validation happens in some methods not all

# validates :views, numericality: { less_than: 10 }
# validates :views, numericality: { less_than: 10 } WHY NOT WORKING THIS ONE?
#   validate :too_many_designs, on: :create
# def too_many_designs
#         if Design.all.length >= 10
#             self.errors.add(:base, :invalid, message: "MY DATABASE IS FULL STOP CREATING IMAGES")
#         end
#     end


#  scope method for this later on
    def self.search(query) 
        self.where("title LIKE ?", "#{query}%")
    end

    def self.most_recent
        self.order(created_at: :desc)
    end

  def uploaded_at 
     self.created_at.to_date
  end

end

#in master for sure
