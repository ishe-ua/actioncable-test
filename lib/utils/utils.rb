# frozen_string_literal: true

# App Utilites
module Utils
  Dir[File.expand_path('**/*.rb', __dir__)].sort.each do |file|
    require(file) if file != __FILE__
  end
end
