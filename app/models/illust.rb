class Illust < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    
    has_many :commentis, dependent: :destroy
    has_many :illust_tag_relations, dependent: :destroy
    has_many :tags, through: :illust_tag_relations, dependent: :destroy

end
