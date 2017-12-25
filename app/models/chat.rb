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

  class << self
    def key_for(user1, user2)
      if user1.is_a?(Integer) && user2.is_a?(Integer)
        a_id = [user1, user2].min
        b_id = [user1, user2].max
      else
        a_id = [user1.id, user2.id].min
        b_id = [user1.id, user2.id].max
      end

      [a_id, b_id]
    end

    def find_for(user1, user2)
      a_id, b_id = key_for(user1, user2)
      find_by(a_id: a_id, b_id: b_id)
    end

    def say(who_id, whom_id, text)
      a_id, b_id = key_for(who_id, whom_id)

      msg = { who:  who_id,
              whom: whom_id,
              text: connection.quote(text),
              date: connection.quoted_date(Time.zone.now) }

      query = "select say(#{a_id}, #{b_id}, #{connection.quote msg.to_s})"
      connection.execute(query) # See db/sql
    end
  end
end
