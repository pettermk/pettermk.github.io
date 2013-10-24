----- 
:created_at: 01 Jan 2000
:title: "Tag: blog"
:menuitem: tag
-----

    <p>1 item is tagged with <em>blog</em>:</p>
    <ul>
      <% articles_tagged_with('blog').each do |a| %>
        <li><%= link_to(a[:title], a) %></li>   
      <% end %>
    </ul>
  
