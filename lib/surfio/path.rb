module Surfio
  class Path
    include Virtus.model

    attribute :path, String

    def keys
      @_keys ||= path.split('.')
    end

    def size
      keys.size
    end
  end
end