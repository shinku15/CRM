class Organization < ApplicationRecord
  has_many :users
  has_many :companies
  has_many :feeds
end
