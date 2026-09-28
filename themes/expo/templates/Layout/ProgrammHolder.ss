<% if TopImage %>
	<div class="topimage" style="background-image: url($TopImage.URL);" aria-hidden="true">
		<div class="container">
			<div class="row">
				<div class="col-12 pagetitle">
					$PageTitle
				</div>
			</div>
		</div>
	</div>
<% else %>
	<div class="notopimage">
		<div class="container">
			<div class="row">
				<div class="col-12 pagetitle">
					$PageTitle
				</div>
			</div>
		</div>
	</div>
<% end_if %>
<section class="greybox pt-0 pb-3 pb-lg-5 mb-5 position-relative z-index-2">
	<div class="container pb-3 pb-lg-5">
		<div class="row">
			<div class="col-12 text-right">
				<% include BreadCrumbs %>
			</div>
		</div>
		<div class="row pt-4">
			<div class="col-12 text-secondary fs-2 fw-bold">
				$Subline
			</div>
			<div class="col-12 col-lg-9 offset-lg-1 h1">
				$Content
			</div>
			
		</div>
	</div>
</section>

<div class=" py-3 py-lg-5 position-relative z-index-2 bg-white">
	<div class="container">
		<div class="row">
			<% loop Children %>
				<div class="col-12 col-md-6 col-lg-4 pb-4 py-2">
					<div class="prodbox boxColor-{$PageColor}">
						<a href="$Me.Link" class="stretched-link">$TopImage.FocusFill(575,362)</a>
						<div>
							<div>
								<span>$Title</span><br>
								$Subline
							</div>
						</div>
					</div>
				</div>
			<% end_loop %>
		</div>
	</div>
</div>

<% include LastNewsBlock %>