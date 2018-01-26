class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :clickbait?
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

  def clickbait?
    
  end
  
end
