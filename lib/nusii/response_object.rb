module Nusii
  class ResponseObject

    attr_accessor :resources, :meta, :resource_class

    def initialize resources, meta, resource_class
      @resources      = resources
      @meta           = meta
      @resource_class = resource_class
    end

    def next_page
      raise(ArgumentError, "That page does no exist") if meta['next_page'] == nil
      resource_class.list(:page => meta['next_page'], :per => per_page)
    end

    def prev_page
      raise(ArgumentError, "That page does no exist") if meta['prev_page'] == nil
      resource_class.list(:page => meta['prev_page'], :per => per_page)
    end

  private

    def per_page
      (meta['total_count'] / meta['total_pages'].to_f).round
    end

  end
end