rake db:migrate SINATRA_ENV=test

code removed from under "Please log in or sign up below"
<nav>
  <% if logged_in? %>

    <a href="/hosts/new"> Create New Host </a>
    <a href="/logout"> Log Out </a>
    <p>Hello, <%=current_user.username %></p>

  <% else %>
    <a href="/signup">Sign Up</a>
    or
    <a href="/login"> Log In </a>
  <%end %>

</nav>
