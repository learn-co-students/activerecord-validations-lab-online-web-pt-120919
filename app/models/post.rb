class Post < ActiveRecord::Base
    # has title
    # content min 250 
    # summary max 250
    # category is either Fiction or Non-Fiction, inclusion validator

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait?

    CLICKBAIT = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
    ]

    def clickbait?
        if CLICKBAIT.none? { |p| p.match title }
          errors.add(:title, "must be clickbait")
        end
    end
end
