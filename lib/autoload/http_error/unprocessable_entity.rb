class HTTPError::UnprocessableEntity < HTTPError::Base
  def initialize(exception)
    @status = 422
    @messages = exception.record.errors.full_messages
  end
end
