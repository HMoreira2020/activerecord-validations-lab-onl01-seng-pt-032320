class Post < ActiveRecord::Base
    validates :title, presence: true 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
        message: "%{value} is not a valid category"}
    validate :title_must_be_click_baity 

    def title_must_be_click_baity
        titles = ["Won't Believe", "Secret", "Top", "Guess"]
        if title.present? && titles.none?{|t| title.include?(t)}
          errors.add(:title, "Title must include 'Won't Believe', 'Secret', 'Top', or 'Guess'!")
        end
    end

     
    
end
