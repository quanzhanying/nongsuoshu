# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  name       :string
#  price      :integer
#  plan_date  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PlansControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
