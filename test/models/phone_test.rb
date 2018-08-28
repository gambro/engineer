# == Schema Information
#
# Table name: phones
#
#  id         :bigint(8)        not null, primary key
#  number     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#

require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
