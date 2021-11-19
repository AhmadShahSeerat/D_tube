class Design < ApplicationRecord 
    belongs_to :collage, optional: true # collage= COLLAGE OBJECT
    belongs_to :user, optional: true
    has_many :comments
    has_many :users, through: :comments
    validates :title, presence: true, uniqueness: true # 0
    validates :description, presence: true # 1 for line 4 and 5
    
           # 2
     def collage_attributes=(attributes)  # 3
        if !(attributes[:name].blank? || attributes[:description].blank?)
            self.collage = Collage.find_or_create_by(attributes)
        end
    end
 
# 4
    scope :search, -> (query) { self.where("title LIKE ?", "#{query}%") }
    # def self.search(query) 
    #     self.where("title LIKE ?", "#{query}%")
    # end

    scope :most_recent, -> { order created_at: :desc}
    # Design.search("d").where(views: 4)
    # def self.most_recent
    #     self.order(created_at: :desc)
    # end
   scope :most_viewed, -> { where("views > ?", 10 )} # here i can use find_by but below i couldnt.
    # def self.most_viewed
    #     self.all.select {|d| d.views > 10 }
    # end

  def uploaded_at 
     self.created_at.to_date
  end

end


    #0 validates :title, presence: true, uniqueness: {scope: :design_url, message: 'Title and Design_Url are not Unique'}
     #1 validates :design_url, presence: true, design_url_format: {on: :create}
    #1 on is when we want this validation happens in some methods not all
    #2 accepts_nested_attributes_for :collage
    #3 to add diff designs into one collage

  #(4) for nested forms: three things 
 #1: in belongs_to model write accepts_nested_attributes_for :collage
 #2: in form write down a f.field_for :collage do |n| and continue its attributes with n 
#           last submit would be with f.submit the first variable.
#3:  create a new empty collage nested with design so that it knows its nested with design
#           if not it assumes there is nested thig
#4: last but not least, add collage_attributes: [:name, :description] to d_cont st_params

# validates :views, numericality: { less_than: 10 }
# validates :views, numericality: { less_than: 10 } WHY NOT WORKING THIS ONE?
#   validate :too_many_designs, on: :create
# def too_many_designs
#         if Design.all.length >= 10
#             self.errors.add(:base, :invalid, message: "MY DATABASE IS FULL STOP CREATING IMAGES")
#         end
#     end

#  scope method for this later on end of (4)

  

    
    
 
    
    
    
    
    
    
    
    