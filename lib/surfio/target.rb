module Surfio
  class Target
    include Virtus.model

    attribute :path, Surfio::Path
    attribute :default, String

    def get(h)
      h_part = h
      path.keys.each_with_index do |key, index|
        return (h_part[key] || default) if index == path.size - 1
        return default if h_part[key].nil?

        h_part = h_part[key]
       end
    end
  end

end