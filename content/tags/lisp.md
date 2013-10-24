----- 
:created_at: 01 Jan 2000
:title: "Tag: lisp"
:menuitem: tag
-----

    <p>1 item is tagged with <em>lisp</em>:</p>
    <ul>
      <% articles_tagged_with('lisp').each do |a| %>
        <li><%= link_to(a[:title], a) %></li>   
      <% end %>
    </ul>
  
