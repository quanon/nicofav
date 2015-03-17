class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_action :flash_to_headers

  rescue_from Exception, with: :handle_error

  private

  def handle_error(exception)
    error = HTTPError::Factory.create(exception)

    if error.is_a?(HTTPError::InternalServerError)
      logger.error exception.message
      logger.error exception.backtrace.join("\n")
    end

    respond_to do |format|
      format.html { render 'errors/show', locals: { messages: error.messages }, status: error.status }
      format.json { render json: error.messages, status: error.status }
    end
  end

  def flash_to_headers
    return unless request.xhr?

    response.headers['X-Flash-Messages'] = flash_json

    # ページをリロードした際に flash メッセージが表示されるのを防ぐ。
    flash.discard
  end

  def flash_json
    flash.each_with_object({}) do |(type, message), hash|
      # 日本語のメッセージをレスポンスヘッダに含めるために URL エンコードしておく。
      message = URI.escape(message)
      hash[type] = message
      hash
    end.to_json
  end
end
