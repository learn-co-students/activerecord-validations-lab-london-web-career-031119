class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates_inclusion_of :category, in: ['Fiction', 'Non-Fictions']
  validate :clickbait?

  CLICKBAIT = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ].freeze

  def clickbait?
    if !CLICKBAIT.any? {|item| item.match(title) }
        errors.add(:title, 'must be clickbait')  
    end
    # errors.add(:title, 'must be clickbait') unless title.match(CLICKBAIT)
  end
end
