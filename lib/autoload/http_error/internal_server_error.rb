class HTTPError::InternalServerError < HTTPError::Base
  def initialize(_exception)
    @status = 500
    @messages = []
    @messages << 'サーバで問題が発生しました。'
  end
end
