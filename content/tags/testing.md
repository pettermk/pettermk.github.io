----- 
:created_at: 01 Jan 2000
:title: "Tag: testing"
:menuitem: tag
-----

    <p>1 item is tagged with <em>testing</em>:</p>
    <ul>
      <% articles_tagged_with('testing').each do |a| %>
        <li><%= link_to(a[:title], a) %></li>   
      <% end %>
    </ul>
  
