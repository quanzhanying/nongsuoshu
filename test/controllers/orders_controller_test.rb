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

require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
