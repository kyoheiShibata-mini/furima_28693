class Comment < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :text
  end
end