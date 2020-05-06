class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: %w(Fiction Non-fiction)}
  validate :non_clickbait
  
  def non_clickbait
    if title && !title.include?( "Won't Believe" || "Secret" || "Top [number]" ||  "Guess")
    errors.add(:title, "cannot contain 
    Won't Believe Secret, Top [number], Guess ")
  end 
end 
end
