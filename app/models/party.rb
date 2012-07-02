class Party < ActiveRecord::Base
  has_many :supplies
  has_many :users
  attr_accessible :date, :description, :dress, :end, :location, :name, :start, :user_id
end

