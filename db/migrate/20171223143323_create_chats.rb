# frozen_string_literal: true
# frozen_string_literal: true

class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.integer :a_id, null: false
      t.integer :b_id, null: false

      t.text :text
      t.timestamps
    end

    add_index :chats, %i[a_id b_id], unique: true
  end
end
