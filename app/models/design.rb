class Design < ApplicationRecord 
    belongs_to :collage, optional: true
    validates :title, presence: true, uniqueness: true
    # validates :title, presence: true, uniqueness: {scope: :design_url, message: 'Title and Design_Url are not Unique'}
    validates :description, presence: true
    # validates :design_url, presence: true, design_url_format: {on: :create}
    # on is when we want this validation happens in some methods not all
    
    # accepts_nested_attributes_for :collage

    def collage_attributes=(attributes) #to add diff designs into one collage
        if !(attributes[:name].blank? || attributes[:description].blank?)
            self.collage = Collage.find_or_create_by(attributes)
        end
    end
 #for nested forms: three things 
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

# echo "# D_tube" >> README.md
# git init
# git add README.md
# git commit -m "first commit"
# git branch -M main
# git remote add origin git@github.com:AhmadShahSeerat/D_tube.git
# git push -u origin main