class Niconico::Movie
  include HappyMapper

  tag 'thumb'

  element :video_id, String, tag: 'video_id'
  element :title, String, tag: 'title'
  element :description, String, tag: 'description'

  element :thumbnail_url, String, tag: 'thumbnail_url'
  element :url, String, tag: 'watch_url'

  element :first_retrieve, DateTime, tag: 'first_retrieve'
  element :length, String, tag: 'length'

  element :view_count,    Integer, tag: 'view_counter'
  element :comment_count, Integer, tag: 'comment_num'
  element :mylist_count,  Integer, tag: 'mylist_counter'

  element :creator_id, Integer, tag: 'user_id'
  element :creator_nickname, String, tag: 'user_nickname'
  element :creator_icon_url, String, tag: 'user_icon_url'

  has_many :tags, String, tag: 'tags/tag'

  def to_hash
    self.class.elements.each_with_object({}) do |element, hash|
      element_name = element.name
      hash[element_name.to_sym] = instance_variable_get("@#{element_name}")
    end
  end
end
