----- 
:created_at: 01 Jan 2000
:title: "Tag: terminal"
:menuitem: tag
-----

    <p>1 item is tagged with <em>terminal</em>:</p>
    <ul>
      <% articles_tagged_with('terminal').each do |a| %>
        <li><%= link_to(a[:title], a) %></li>   
      <% end %>
    </ul>
  