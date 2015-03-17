class HTTPError::Factory
  def self.create(exception)
    error_class =
      case exception
      when ActiveRecord::RecordNotFound
        HTTPError::NotFound
      when ActiveRecord::RecordInvalid
        HTTPError::UnprocessableEntity
      when ActionController::InvalidAuthenticityToken
        HTTPError::Unauthorized
      else
        HTTPError::InternalServerError
      end

    error_class.new(exception)
  end
end
