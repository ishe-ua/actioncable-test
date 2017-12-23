# frozen_string_literal: true

# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  a_id       :integer          not null
#  b_id       :integer          not null
#  log        :text             default([]), not null, is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_chats_on_a_id_and_b_id  (a_id,b_id) UNIQUE
#

class Chat < ApplicationRecord
  include Pair
  include Log

  def self.say(who_id, whom_id, text)
    raise if a_id == b_id

    a_id = [who_id, whom_id].min
    b_id = [who_id, whom_id].max

    msg = { who: a_id, whom: b_id, text: text, date: Time.zone.now }
    msg # TODO: exec plsql function
  end
end
