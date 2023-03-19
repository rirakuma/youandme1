class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  belongs_to :illust
end
