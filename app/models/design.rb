class Design < ApplicationRecord 
    belongs_to :collage, optional: true 
    belongs_to :user, optional: true
    has_many :comments
    has_many :users, through: :comments
    validates :title, presence: true, uniqueness: {scope: :design_url, message: "Title and URL are not unique"}
    validates :description, presence: true 
    
        
     def collage_attributes=(attributes) 
        if !(attributes[:name].blank? || attributes[:description].blank?)
            self.collage = Collage.find_or_create_by(attributes)
        end
    end
 
    scope :search, -> (query) { self.where("title LIKE ?", "#{query}%") }
  
    scope :most_recent, -> { order created_at: :desc}
    
   scope :most_viewed, -> { where("views > ?", 10 )}
  
  def uploaded_at 
     self.created_at.to_date
  end

end


  