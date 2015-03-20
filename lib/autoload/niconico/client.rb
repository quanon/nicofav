class Niconico::Client
  def initialize(video_id)
    @uri = URI.parse("http://ext.nicovideo.jp/api/getthumbinfo/#{video_id}")
  end

  def movie
    @movie ||= Niconico::Movie.parse(xml, single: true)
  end

  private

  def xml
    @xml ||= Net::HTTP.get(@uri)
  end
end
