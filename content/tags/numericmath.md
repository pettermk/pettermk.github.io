----- 
:created_at: 01 Jan 2000
:title: "Tag: numericmath"
:menuitem: tag
-----

    <p>1 item is tagged with <em>numericmath</em>:</p>
    <ul>
      <% articles_tagged_with('numericmath').each do |a| %>
        <li><%= link_to(a[:title], a) %></li>   
      <% end %>
    </ul>
  
