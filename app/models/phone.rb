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

class Phone < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :number, presence: true, length: { maximum: 12},
                     format: { with: /\A\d{3}-\d{3}-\d{4}\z/i },
                     uniqueness: { case_sensitive: false}

  def self.random_phone
    first_block = split_number[0..2].join
    second_block = split_number[3..5].join
    last_block = split_number[6..9].join
    [first_block, second_block, last_block].join('-')
  end

  private

  def self.split_number
    rand(111_111_1111..999_999_9999).to_s.split('')
  end
end
