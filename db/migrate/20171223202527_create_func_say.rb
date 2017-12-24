# frozen_string_literal: true

class CreateFuncSay < ActiveRecord::Migration[5.1]
  def up
    exec_sql('say') # See lib/utils
  end

  def down
    exec_sql('drop_say')
  end
end
