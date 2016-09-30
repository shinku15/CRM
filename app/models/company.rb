class Company < ApplicationRecord
  belongs_to :organization, optional: :true
  has_many :notes
  has_many :tasks
  has_many :feeds
end
