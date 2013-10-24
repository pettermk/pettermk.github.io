require 'coderay'

module Nanoc3::Helpers::Filtering

  def highlight(syntax, &block)
    data = capture(&block)
    # Reconvert <% %>
    data.gsub! /&lt;%/, '<%'
    data.gsub! /%&gt;/, '%>'
    filtered_data = CodeRay.scan(data.strip, syntax).div(:line_numbers => :inline, :tab_width => 2, :css =>:class)
    filtered_data = filtered_data
    buffer = eval('_erbout', block.binding)
    buffer << filtered_data
  end

end
