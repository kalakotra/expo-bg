<nav class="primary">
	<ul class="nav nav-fill- justify-content-end d-lg-none pe-4">
		<li class="nav-item text-center">
        	<% loop $Locales %>
        		<% if LinkingMode != "current" %>
					<a href="$Link.ATT" <% if $LinkingMode != 'invalid' %>rel="alternate" hreflang="$Language"<% end_if %>>
		            	<span class="langlink text-secondary fw-bold pe-3">
							<% if $Title=English %>
								EN
							<% else_if $Title=Deutsch %>
								DE
							<% else %>
								SR
							<% end_if %>
						</span>
		        	</a>
		        <% end_if %>
		    <% end_loop %>
	        <a data-src="https://www.facebook.com/sharer/sharer.php?u={$BaseHref}" href="javascript:;" class="ms-3 fbShareMobile" title="<%t Page.FBShare 'Seite auf Facebook teilen' %>"><img src="$themedResourceURL('/images/share.png')" alt="share" width="18" height="18" /></a>
	    </li>
	</ul>
	<ul class="nav nav-fill pt-0 pt-lg-5">
        <% loop $Menu(1) %>
			<li class="$LinkingMode nav-item">
				<a <% if Deactivated %><% else %>href="$Link"<% end_if %> title="$Title.XML" class="<% if Deactivated %>disabled<% end_if %> nav-link">$MenuTitle.XML</a>
				
				
					<% if Children %>
						<ul class="submenu">
							<% loop Children %>
								<li class="$LinkingMode nav-item">
									<a <% if Deactivated %><% else %>href="$Link"<% end_if %> title="$Title.XML" class="<% if Deactivated %>disabled<% end_if %> nav-link">$MenuTitle.XML</a>
								</li>
							<% end_loop %>
						</ul>
					<% end_if %>
			</li>
		<% end_loop %>
	</ul>
</nav>
