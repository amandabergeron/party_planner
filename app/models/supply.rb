class Supply < ActiveRecord::Base
  belongs_to :party
  has_one :user
  attr_accessible :amount, :name, :party_id, :user_id
end

