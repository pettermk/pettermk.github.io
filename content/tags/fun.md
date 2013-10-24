----- 
:created_at: 01 Jan 2000
:title: "Tag: fun"
:menuitem: tag
-----

    <p>1 item is tagged with <em>fun</em>:</p>
    <ul>
      <% articles_tagged_with('fun').each do |a| %>
        <li><%= link_to(a[:title], a) %></li>   
      <% end %>
    </ul>
  
