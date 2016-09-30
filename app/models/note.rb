class Note < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :feeds, as: :feedable
 

end