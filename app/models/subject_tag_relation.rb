class SubjectTagRelation < ApplicationRecord
  belongs_to :subject
  belongs_to :tag
end
