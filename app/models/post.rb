class Post < ActiveRecord::Base
    # validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait_title, on: :create

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

#   def clickbait_title
#         if ARR.none? {|x| x.match title}
#             errors.add(:title, "Not a clickbait Bruh") unless title.none? {|x| x.match title}
#         end
#     end