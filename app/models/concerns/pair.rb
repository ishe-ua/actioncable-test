# frozen_string_literal: true

module Pair
  extend ActiveSupport::Concern

  included do
    alias_attribute :first_user_id,  :a_id
    alias_attribute :second_user_id, :b_id

    validates :a_id, presence: true, uniqueness: { scope: :b_id }
    validates :b_id, presence: true

    validate :a_less_then_b
  end

  class_methods do
    def key_pair(user1, user2)
      if user1.is_a?(Integer) && user2.is_a?(Integer)
        a_id = [user1, user2].min
        b_id = [user1, user2].max
      else
        a_id = [user1.id, user2.id].min
        b_id = [user1.id, user2.id].max
      end

      [a_id, b_id]
    end

    def str_key_pair(user1, user2)
      key_pair(user1, user2).join('_')
    end
  end

  protected

  def a_less_then_b
    return if Rails.env.test?
    return unless a_id && b_id
    errors[:base] << 'a should be less then b' unless a_id < b_id
  end
end
