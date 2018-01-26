class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :has_clickbait?
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

  def has_clickbait?
    clickbaits = [title.include?("Won't Believe"), title.include?("Secret"), title.include?("Guess"), !(title =~ /([t][o][p]|[T][o][p])\s{1}\d+/).nil?]
    if !clickbaits.include?(true)
      errors.add(:title, "must include clickbait-y")
    end
  end

end
