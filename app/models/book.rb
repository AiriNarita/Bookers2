 class Book < ApplicationRecord

   belongs_to :user
   
 validates :title, presence: true
 validates :body,length: { maximum: 150 }, presence: true

 end