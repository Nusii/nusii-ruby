require "nusii/version"

module Nusii
  extend self

  class << self
    attr_accessor :api_key, :client_name
  end
end
