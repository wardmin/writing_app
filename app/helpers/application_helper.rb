module ApplicationHelper
	def markdown(text)
	    options = {
	      filter_html:     true,
	      hard_wrap:       true, 
	      link_attributes: { rel: 'nofollow', target: "_blank" },
	      space_after_headers: true, 
	      fenced_code_blocks: true,
	      no_intra_emphasis: true,
	      no_images: true
	    }

	    extensions = {
	      autolink:           true,
	      superscript:        true,
	      disable_indented_code_blocks: true
	    }

	    renderer = Redcarpet::Render::HTML.new(options)
	    markdown = Redcarpet::Markdown.new(renderer, extensions)

	    markdown.render(text).html_safe
  end
  def time_left(deadline)
  	if deadline
  		(deadline - Date.today).to_i
  	elsif deadline == nil
  		return 0
  	end
  end
end
