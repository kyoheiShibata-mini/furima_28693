class Comment < ApplicationRecord
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :text
  end
end