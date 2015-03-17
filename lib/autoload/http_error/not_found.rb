class HTTPError::NotFound < HTTPError::Base
  def initialize(_exception)
    @status = 404
    @messages = []
    @messages << 'データがありません。'
  end
end
