<div class="HeaderImage" aria-hidden="true">
	<% if HeaderImage %>
		$HeaderImage.FocusFill(1920,800)
	<% else %>
		$SiteConfig.DefaultHeaderImage.FocusFill(1920,800)
	<% end_if %>
</div>