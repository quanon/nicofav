class HTTPError::Forbidden < HTTPError::Base
  def initialize(_exception)
    @status = 403
    @messages = []
    @messages << '権限がありません。'
  end
end
