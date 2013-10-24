----- 
:created_at: 01 Jan 2000
:title: "Tag: programming"
:menuitem: tag
-----

    <p>2 items are tagged with <em>programming</em>:</p>
    <ul>
      <% articles_tagged_with('programming').each do |a| %>
        <li><%= link_to(a[:title], a) %></li>   
      <% end %>
    </ul>
  
