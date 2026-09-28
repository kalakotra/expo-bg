<main class="position-relative z-index-2">
	<% if TopImage %>
		<div class="container-fluid topimage" style="background-image: url($TopImage.URL);" >
			<div class="container">
				<div class="row">
                    <div>
                        $TopImage
                    </div>
					<div class="col-12 pagetitle">
						<% if PageTitle %>
							$PageTitle
						<% else %>
							<h1 class="mb-0">$Title</h1>
						<% end_if %>
					</div>
				</div>
			</div>
		</div>
	<% else %>
			<div class="container-fluid notopimage" >
				<div class="container">
					<div class="row">
						<div class="col-12 pagetitle">
							<% if PageTitle %>
								$PageTitle
							<% else %>
								<h1>$Title</h1>
							<% end_if %>
						</div>
					</div>
				</div>
			</div>
	<% end_if %>
	<div class="container pt-3 pb-5">
		<div class="row pb-5">
			<div class="col-lg-10 offset-lg-1">
				<article>
					<div class="content">$Content</div>
				</article>
			</div>
            <div class="col-lg-10 offset-lg-1 text-center py-3 py-lg-5">
                <a href="/home" class="btn btn-secondary">Information</a> &nbsp; <a href="/de/kontakt/kontaktformular-u/" class="btn btn-secondary">Innovation</a> &nbsp; <a href="/de/kooperationen/" class="btn btn-secondary">Kooperationen</a>
            </div>
		</div>
	</div>
</main>