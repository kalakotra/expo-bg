<% include HeaderImage %>
<main class="block block--content" role="main">
    <% include BreadCrumbs %>
	<div class="container">
		<div class="row">
			<div class="col-12 col-xl-9">
				<article>
                    <% if $PressDate %>
                        <p class="press-date">$PressDate.Nice</p>
                    <% end_if %>
					<h1 class="font-trois title-color">$Title</h1>
					<div class="content">$Content</div>
				</article>
			</div>
		</div>
	</div>
</main>

$ElementalArea