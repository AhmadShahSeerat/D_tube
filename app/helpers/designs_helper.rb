module DesignsHelper
    def index_date_format(design)
        created = design.created_at.to_datetime
        now = DateTime.now 
        seconds = ((now - created) * 24 * 60 * 60).to_i
        minutes = seconds/60 
        hours = minutes/60
        days = hours/24
        months = days/30
        years = months/12

        if seconds < 60 
            return "#{seconds} seconds ago"
        elsif minutes < 60 
            return "#{minutes} minutes ago"
        elsif hours < 24 
            return "#{hours} hours ago"
        elsif days < 24 
            return "#{days} days ago"
        elsif
            months < 30 
            return "#{months} ago"
        else  
            return "#{years} years ago"
        end

    end
end
