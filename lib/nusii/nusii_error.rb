module Nusii
  class NusiiError < StandardError
    attr_reader :status, :body, :reason_phrase

    def initialize status, body, reason_phrase
      @status        = status
      @body          = body
      @reason_phrase = reason_phrase
    end

    def to_s
      message_text = message.present? ? "\nMessage: #{message}" : ''
      "Status: #{status}#{message_text}"
    end

    def message
      @message ||= body.presence || reason_phrase.presence
    end

    def self.error_for status
      case status
      when 400 then BadRequestError
      when 401 then UnauthorizedError
      when 403 then ForbiddenError
      when 404 then NotFoundError
      when 405 then MethodNotAllowedError
      when 406 then NotAcceptableError
      when 410 then GoneError
      when 429 then TooManyRequestsError
      when 500 then IntervalServerError
      when 503 then ServiceUnavailableError
      else NusiiError
      end
    end
  end

  class BadRequestError < NusiiError; end
  class UnauthorizedError < NusiiError; end
  class ForbiddenError < NusiiError; end
  class NotFoundError < NusiiError; end
  class MethodNotAllowedError < NusiiError; end
  class NotAcceptableError < NusiiError; end
  class GoneError < NusiiError; end
  class TooManyRequestsError < NusiiError; end
  class IntervalServerError < NusiiError; end
  class ServiceUnavailableError < NusiiError; end

end