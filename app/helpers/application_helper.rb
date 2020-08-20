# frozen_string_literal: true

# helper functions for the application view
module ApplicationHelper
  def markdown(content)
    @markdown ||=
      Redcarpet::Markdown.new(
        Redcarpet::Render::HTML,
        autolink: true, space_after_headers: true, fenced_code_blocks: true
      )
    @markdown.render(content || ' ')
  end
end
