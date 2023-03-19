class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      
         has_many :subjects, dependent: :destroy
         has_many :illusts, dependent: :destroy 
         has_many :comments, dependent: :destroy
         has_many :commentis, dependent: :destroy

         validates :name, presence: true
         validates :profile, length: { maximum: 200 } 

end
