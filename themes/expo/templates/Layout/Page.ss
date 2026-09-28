<div class="HeaderImage" aria-hidden="true">
	<% if HeaderImage %>
		$HeaderImage.Fit(1920,880)
	<% else %>
		$SiteConfig.DefaultHeaderImage.Fit(1920,880)
	<% end_if %>
</div>
<main class="block block--content" role="main">
	<div class="container">
		<div class="row">
			<div class="col-12 col-lg-9">
				<article>
					<h1 class="font-trois title-color">$Title</h1>
					<div class="content">$Content</div>
				</article>
				$Form
				$CommentsForm
			</div>
		</div>
	</div>
</main>