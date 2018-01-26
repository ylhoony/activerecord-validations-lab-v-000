class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :clickbait?
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

  def clickbait?
    !!title.include?("Won't Believe") || !!title.include?("Secret") || !!title.include?("Guess") || !(a =~ /([t][o][p]|[T][o][p])\s{1}\d+/).nil?
  end

end
