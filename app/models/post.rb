class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
   validates :summary, length: { maximum: 10 }
   validates :category, :inclusion => { :in => %w(Fiction Non-Fiction) }
   validate :clickbait_title, on: :create
#    validates :category, length: { is: 6 }

ARR = ["Won't Believe", "Secret", "Top", "Guess"]

def clickbait_title
    if title?
        if !(ARR.find {|x| title.match x})
           errors.add(:title, "Not a clickbait Bruh")
        end
    else
        errors.add(:title, "Not a title Bruh")
    end
end


end
