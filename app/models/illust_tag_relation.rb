class IllustTagRelation < ApplicationRecord
  belongs_to :illust
  belongs_to :tag
end
