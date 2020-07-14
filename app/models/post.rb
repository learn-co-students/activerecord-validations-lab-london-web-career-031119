class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :check_clickbait
    
    ARRAY = ["Won't Believe", "Secret", "Top", "Guess"]

    def check_clickbait
        if title?
            if !(ARRAY.find {|match| title.match match})
               errors.add(:title, "Not clickbait")
            end
        end
    end
end
