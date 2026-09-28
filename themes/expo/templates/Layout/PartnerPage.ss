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
<section class="pb-3 pb-lg-5  position-relative z-index-2 bg-white">
	<div class="container">
		<div class="row">
			<div class="col-12 text-right">
				<% include BreadCrumbs %>
			</div>
		</div>
		<div class="row">
			<div class="col-12 text-secondary fs-2 fw-bold py-3 d-none">
				$Subline
			</div>
			<div class="col-12 col-lg-11- offset-lg-1-">
				<div class="row ">
					<div class="col-12 col-lg-5 py-3">
						<div class="pb-3">$Logo</div>
						$Content
					</div>
					<div class="col-12 col-lg-6 offset-lg-1 py-3">
						<div class="factsBlock">
							<div class="row">
								<div class="col-12 fs-2-5rem fw-bold py-2">
									$FactsHeadline
								</div>
								<% loop Facts %>
									<div class="col-12 col-lg-4 fw-bold py-2">
										$Caption
									</div>
									<div class="col-12 col-lg-8 py-2">
										$Text
									</div>
								<% end_loop %>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</section>

<% include GalleryImages %>

<section class="testimonialHolder border-bottom">
	<div class="container py-3 py-lg-5">
		<div class="row align-items-center py-3 py-lg-5">
			<div class="col-12 col-md-6 col-xl-4 py-3 PartnerPageBottomImage">
				$BottomImage.FocusFill(280,280)
			</div>
			<div class="col-12 col-md-6 col-xl-8 py-3">
				<div class="fs-2 text-secondary pb-3">$BottomContent</div>
				<div class="fs-3">$BottomContentName</div>
			</div>
		</div>
	</div>
</section>