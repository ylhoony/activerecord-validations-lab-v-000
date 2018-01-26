require 'pry'

class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :is_clickbait?
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def :is_clickbait?
    binding.pry
    clickbaits = [title.include?("Won't Believe"), title.include?("Secret"), title.include?("Guess"), !!(title =~ /([t][o][p]|[T][o][p])\s{1}\d+/)]
    if !clickbaits.include?(true)
      errors.add(:title, "must include clickbait-y")
    end
  end

end
