<h1> Autorzy naszego wspanialego forum </h1>
<% if alert%>
<p>Uwaga!: <%=alert%></p>
<% elsif notice %>
<p>generalnie spoko, ale : <%=notice%></p>
<% end %>
<dl>
<% @authors.each do |author| %>
<dt>
	<%= author.nickname %>
	<%= link_to "Przejdź do", author_path(author.id) %>
</dt>
<% end %>
</dl>