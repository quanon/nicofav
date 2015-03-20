class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def create
    begin
      movie = Movie.create_by_video_id(create_params[:video_id])
    rescue ActiveRecord::RecordInvalid => e
      flash[:error] = e.message
      redirect_to(action: :index)
      return
    end

    flash[:notice] = "「#{movie.title}」を追加しました。"

    redirect_to(action: :index)
  end

  private

  def create_params
    params.require(:movie).permit(:video_id)
  end
end
