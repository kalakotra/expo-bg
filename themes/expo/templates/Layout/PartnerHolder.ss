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
		<div class="row pt-3">
			<div class="col-12 text-secondary fs-2 fw-bold py-3">
				$Subline
			</div>
			<div class="col-12 col-lg-11 offset-lg-1">
				<div class="row ">
					<div class="col-12 col-lg-5 py-3">
						$Content
					</div>
					<div class="col-12 col-lg-5 offset-lg-1 py-3">
						$Content2
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>

<% if Children.filter('PartnerCategory','Pavillon') %>
<div class=" py-3 py-lg-5 position-relative z-index-2 bg-white">
	<div class="container">
		<div class="row g-0">
			<% if PavillonText %>
				<div class="col-12 py-3">
					$PavillonText
				</div>
			<% end_if %>
			<% loop Children.filter('PartnerCategory','Pavillon') %>
				<div class="col-12 col-md-6 col-lg-3 pb-4 py-2 position-relative">
					<div class="partnerBox">
						<a href="$Link" class="stretched-link">
							<div class="p-4 text-center">
								<% if Logo %>
									$Logo.Pad(150,150,FFFFFF,100)
								<% else %>
									<img src="$themedResourceURL('images/blank.png')" alt="$Title" loading='lazy' width='200' height='200' />
								<% end_if %>
							</div>
						</a>
						<div class="text-center py-2 px-3 bg-light bg-opacity-25">
                            <strong>$Title</strong><br>
                            $Subline
                        </div>
					</div>
				</div>
			<% end_loop %>
		</div>
	</div>
</div>
<% end_if %>

<% if Children.filter('PartnerCategory','Gastronomie') %>
<div class=" py-3 py-lg-5 position-relative z-index-2 bg-white">
	<div class="container">
		<div class="row g-0">
			<% if GastronomieText %>
				<div class="col-12 py-3">
					$GastronomieText
				</div>
			<% end_if %>
			<% loop Children.filter('PartnerCategory','Gastronomie') %>
				<div class="col-12 col-md-6 col-lg-3 pb-4 py-2 position-relative">
					<div class="partnerBox">
						<a href="$Link" class="stretched-link">
							<div class="p-4 text-center">
								<% if Logo %>
									$Logo.Pad(150,150,FFFFFF,100)
								<% else %>
									<img src="$themedResourceURL('images/blank.png')" alt="$Title" loading='lazy' width='200' height='200' />
								<% end_if %>
							</div>
						</a>
						<div class="text-center py-2 px-3 bg-light bg-opacity-25">
                            <strong>$Title</strong><br>
                            $Subline
                        </div>
					</div>
				</div>
			<% end_loop %>
		</div>
	</div>
</div>
<% end_if %>
