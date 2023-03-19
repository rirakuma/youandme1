class Subject < ApplicationRecord
    belongs_to :user
    
    has_many :comments, dependent: :destroy
    has_many :subject_tag_relations, dependent: :destroy
    has_many :tags, through: :subject_tag_relations, dependent: :destroy
end
