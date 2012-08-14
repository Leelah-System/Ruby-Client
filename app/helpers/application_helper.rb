module ApplicationHelper
  def get_link_to(link)
	link_to [content_tag(:span, link.to_s, :class => "title")].map{|span| span}.reduce(:<<), link
  end
  
  def navigation(*links)
    content_tag :ul, :class => 'nav' do
      links.map{ |link| 
		content_tag :li, :class => "" + (" active" if controller.controller_name.to_sym == link).to_s do
		  get_link_to(link)
		end
	  }.reduce(:<<)
    end
  end
end
