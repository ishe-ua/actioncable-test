# frozen_string_literal: true

# See db/sql
class ActiveRecord::Migration
  # Base method
  def exec_sql(file_or_query) # rubocop:disable MethodLength
    filename = Rails.root.join('db', 'sql', file_or_query + '.sql')

    query = if File.exist?(filename)
              lines = []
              File.new(filename).each_line do |line|
                lines.push(line) unless line.start_with?('--') # remove comments
              end
              lines.join("\n")
            else
              file_or_query
            end

    ActiveRecord::Base.connection.execute(query)
  end
end
