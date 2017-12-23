# frozen_string_literal: true
# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  a_id       :integer          not null
#  b_id       :integer          not null
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_chats_on_a_id_and_b_id  (a_id,b_id) UNIQUE
#
class Chat < ApplicationRecord
  alias_attribute :first_user_id,  :a_id
  alias_attribute :second_user_id, :b_id

  validates :a_id, presence: true, uniqueness: { scope: :b_id }
  validates :b_id, presence: true

  # TODO: a_id < b_id validation

  # include Pair
  # include Log

  # def self.say(who_id, whom_id, text)
  # end
end
