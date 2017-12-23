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

  protected

  def a_less_then_b
    return if Rails.env.test?
    return unless a_id && b_id
    errors[:base] << 'a should be less then b' unless a_id < b_id
  end
end
