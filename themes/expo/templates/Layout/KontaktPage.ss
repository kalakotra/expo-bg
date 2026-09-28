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
<div class="container-fluid relativer mb-5 z-index-2">
	<div class="container">
		<div class="row">
			<div class="col-12 text-right">
				<% include BreadCrumbs %>
			</div>
		</div>
		<div class="row pt-5">
			<div class="col-12 text-secondary fs-2 fw-bold py-3">
				$Subline
			</div>
			<div class="col-12 col-lg-10 offset-lg-1 py-3">
				$Content
			</div>
			
		</div>
	</div>
</div>

<% include InvolvedBox %>

<div class="container-fluid py-5 d-none" data-info="check do we need on contact">
	<div class="row pb-5">
		<div class="col-12">
			<% loop GalleryImages %>
				<a href="$Me.URL" class="fancybox galimg" rel="gal">$Me.ScaleHeight(260)</a>
			<% end_loop %>
		</div>
	</div>
</div>

<div class="container py-3 py-lg-5 position-relative z-index-2">
	<div class="row">
		<div class="col-12 text-secondary fs-2 fw-bold">
			$TeamHeadline
		</div>
	</div>

	<div class="row justify-content-between py-3 py-lg-5">
	<% loop TeamMembers %>
	
		<div class="col-6 col-md-4 col-lg-2 py-3">
			<div class="tmmember">
				<div class="tmimage d-none" style="background-image: url($Me.Bild.Fill(275,275).URL);"></div>
				$Bild.FocusFill(275,275)
				<div class="py-3">
					<span class="fw-500">$Name</span><br>
					$Funktion
				</div>
				<a href="mailto:$Email"><i class="fas fa-envelope-square fa-2x"></i></a>
				<% if $LinkedIn %>
					<a href="$LinkedIn" target="_blank" rel="noopener"><i class="fab fa-linkedin fa-2x"></i></a>
				<% end_if %>
			</div>

		</div>
	
	<% end_loop %>
	</div>
</div>


