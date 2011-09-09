module ApplicationHelper
  def markdown(text)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    Redcarpet.new(text, *options).to_html.to_s.gsub(/href/, 'target="_blank" href').html_safe
  end
  
  def link_to_external(text, url)
    link_to text, url, :rel => 'external', :target => '_blank'
  end
end
