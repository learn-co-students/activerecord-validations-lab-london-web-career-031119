class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction), message: "Must be either Fiction or Non-Fiction"}
  validate :clickbait

  def clickbait
    choices = [/Won't Believe/i, /Secret/i, /Top/i, /Guess/i]
    if !choices.any? {|choice| choice.match(title)}
      errors.add(:title, "must contain clickbait words!")
    end
  end

end
