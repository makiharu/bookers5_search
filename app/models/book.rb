class Book < ApplicationRecord
	belongs_to :user

	validates :title, presence: true

	validates :body, presence: true, length: {maximum: 200}


    def self.search(search)   
        if search  
          Book.where(['title LIKE ?', "%#{search}%"])   
        else  
          Book.all  
        end  
    end  
end

