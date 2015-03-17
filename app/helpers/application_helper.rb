module ApplicationHelper
  def body_class
    classes = controller_path.split('/')
    classes << action_name
    classes * ' '
  end

  def callout(type: :default, title: nil, body: nil)
    content_tag(:div, class: "bs-callout bs-callout-#{type}") do
      concat(content_tag(:h4) { title.html_safe }) if title
      concat(content_tag(:div) { body.html_safe }) if body
    end
  end

  def required_mark
    content_tag(:span) { ' *' }
  end

  def stacked_progress_bar(success = 0, warning = 0, danger = 0)
    content_tag(:div, class: 'progress') do
      concat(progress_bar(:success, success))
      concat(progress_bar(:warning, warning))
      concat(progress_bar(:danger, danger))
    end
  end

  def progress_bar(type, width = 0)
    content_tag(
      :div,
      nil,
      class: "progress-bar progress-bar-#{type}",
      style: "width: #{width}%"
    )
  end

  def datatable(width: '100%', url:, css_class: '', &block)
    base_class = 'table table-bordered dt-responsive no-wrap js-data-table'

    content_tag(
      :table,
      class:
        if css_class.present?
          "#{base_class} #{css_class}"
        else
          base_class
        end,
      width: width,
      cellspacing: 0,
      data: { source: url },
      &block
    )
  end

  # 改行を <br> タグに変換する。
  def nl2br(str)
    ERB::Util.h(str).gsub(/(\r\n?)|(\n)/, '<br>').html_safe
  end
end
