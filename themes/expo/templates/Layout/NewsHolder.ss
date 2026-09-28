<% if TopImage %>
	<div class="container-fluid topimage" style="background-image: url($TopImage.URL);" aria-hidden="true">
		<div class="container">
			<div class="row">
				<div class="col-12 pagetitle">
					$PageTitle
				</div>
			</div>
		</div>
	</div>
<% else %>
	<div class="container-fluid notopimage">
		<div class="container">
			<div class="row">
				<div class="col-12 pagetitle">
					$PageTitle
				</div>
			</div>
		</div>
	</div>
<% end_if %>
<div class="container-fluid relativer mb-5- z-index-2">
	<div class="container">
		<div class="row">
			<div class="col-12 text-right">
				<% include BreadCrumbs %>
			</div>
		</div>
		<div class="row">
			<div class="col-12 text-secondary fs-2 fw-bold py-3">
				$Subline
			</div>
			<div class="col-12 col-lg-11 offset-lg-1 py-3">
				$Content
			</div>
			
		</div>
	</div>
</div>

<section class=" py-3 py-lg-5- position-relative z-index-3 bg-white">
	<div class="container">
		<div class="row">
			<div class="col-12 text-secondary fs-2 fw-bold py-3">
				$NewsListHeadline
			</div>

			<% loop Children.sort("NewsDate DESC") %>
				<div class="col-12 col-md-6 col-lg-4  py-3 position-relative">
					<div class="prodbox--">
						<a href="$Me.Link" class="stretched-link roundedImageChild">$TopImage.FocusFill(575,362)</a>
						<% if NewsDate %>
							<div class="text-secondary fs-5 fw-400 pt-4">
								$NewsDate.format('dd.MM.y')
							</div>
						<% end_if %>
						<div>$MenuTitle</div>
					</div>
				</div>
			<% end_loop %>
		</div>
	</div>
</section>
