----- 
:created_at: 01 Jan 2000
:title: "Tag: education"
:menuitem: tag
-----

    <p>1 item is tagged with <em>education</em>:</p>
    <ul>
      <% articles_tagged_with('education').each do |a| %>
        <li><%= link_to(a[:title], a) %></li>   
      <% end %>
    </ul>
  
