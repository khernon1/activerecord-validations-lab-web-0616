class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :word_check

  def word_check
    invalid_arr = ["Won't Believe", "Secret", "Top ", "Guess"]
    result = false    
    invalid_arr.each do |arr|
      result = true if title != nil && title.include?(arr)              
    end
    self.errors.add(:base, "Sounds spammy") if result == false
  end

end
