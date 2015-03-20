module FilterByAttributes
  extend ActiveSupport::Concern

  module ClassMethods
    def filter_by_attributes(hash)
      hash.reject { |key, _| !key.to_s.in?(column_names) }
    end
  end
end
