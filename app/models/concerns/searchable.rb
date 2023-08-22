# require 'elasticsearch/model'

module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    settings index: { number_of_shards: 1 } do
      mappings dynamic: 'false' do
        indexes :body, type: 'text'
      end
    end

    def as_indexed_json(_options = {})
      {
        body: body
      }
    end
  end
end
