class HTTPError::Unauthorized < HTTPError::Base
  def initialize(_exception)
    @status = 401
    @messages = []
    @messages << '認証に失敗しました。'
  end
end
