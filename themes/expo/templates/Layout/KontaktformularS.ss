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
<div class="container-fluid position-relative z-index-2 pb-3 pb-lg-5 bg-white border-bottom border-light mb-5">
	<div class="container">
		<div class="row">
			<div class="col-12 text-right">
				<% include BreadCrumbs %>
			</div>
		</div>
		<div class="row py-3 py-lg-5">
			<div class="col-12 text-secondary fs-2 fw-bold">
				$Subline
			</div>
			<div class="col-12 col-lg-9 offset-lg-1">
				$Content

				$ContactForm
			</div>
			
		</div>
	</div>
</div>
<div class="w-100 py-3"></div>