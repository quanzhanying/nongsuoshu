class Order < ApplicationRecord
  belongs_to :user
  belongs_to :plan

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end

  def paid?
    is_paid
  end
end
