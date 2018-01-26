require 'pry'

class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :must_have_clickbait
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

  def must_have_clickbait
    binding.pry
    clickbaits = [title.include?("Won't Believe"), title.include?("Secret"), title.include?("Guess"), !(title =~ /([t][o][p]|[T][o][p])\s{1}\d+/)]
    if !clickbaits.include?(true)
      errors.add(:title, "must include clickbait-y")
    end
  end

end
