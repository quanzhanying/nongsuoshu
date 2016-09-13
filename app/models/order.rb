# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  price          :integer
#  plan_id        :integer
#  is_paid        :boolean
#  payment_method :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  token          :string
#  aasm_state     :string
#

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

  include AASM

  scope :recent, -> { order("created_at DESC") }

  aasm do
    state :unpaid, initial: true
    state :paid
    state :order_cancelled

    event :make_payment do
      transitions from: :unpaid, to: :paid
    end

    event :cancel_order do
      transitions from: :unpaid, to: :order_cancelled
    end
  end

  def pay(pay_way)
    self.payment_method = pay_way
    make_payment!

    save
  end
end
