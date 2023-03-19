class Tag < ApplicationRecord
    validates :name, presence: true

  has_many :subject_tag_relations, dependent: :destroy
  has_many :subjects, through: :subject_tag_relations, dependent: :destroy
end
