# frozen_string_literal: true

# Build instance of model from fixture's DEFAULTS.
def build(model_name, attributes = {}) # rubocop:disable AbcSize, MethodLength
  hash = begin
           path = fixtures_path + '/' + model_name.to_s.pluralize + '.yml'
           line = YAML.load(ERB.new(File.read(path)).result)['DEFAULTS'] # rubocop:disable YAMLLoad, LineLength
           instance_eval(ERB.new(line.to_s.gsub('$LABEL', 'sample')).result)
         end

  attributes.each { |key, value| hash[key] = value }

  ##

  correction = lambda do |ref| # hack
    if hash[ref].present?
      hash["#{ref}_id"] = users(hash[ref].to_sym).id
      hash.delete(ref)
    end
  end

  correction.call('user')

  ##

  model_name.to_s
            .classify
            .constantize.new(hash)
end
