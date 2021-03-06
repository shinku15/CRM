class Organization < ApplicationRecord
  has_many :users, dependent:  :destroy
  has_many :companies, dependent:  :destroy
  has_many :feeds,dependent:  :destroy
  has_many :tasks,dependent: :destroy
  has_many :notes,dependent: :destroy
  has_many :roles, dependent: :destroy
end
