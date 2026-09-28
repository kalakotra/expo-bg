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
<section class="pb-3 pb-lg-5 position-relative z-index-2 bg-white">
	<div class="container">
		<div class="row">
			<div class="col-12 text-right">
				<% include BreadCrumbs %>
			</div>
		</div>
		<div class="row pt-5-">
			<div class="col-12 text-secondary fs-2 fw-bold py-3">
				$Subline
				<div>$NewsDate.format('dd.MM.y')</div>
			</div>
			<div class="col-12 col-lg-11 offset-lg-1">
				<div class="row ">
					<div class="col-12 <% if NewsFacts %>col-lg-5<% else %>col-lg-11<% end_if %> py-3">
						$Content
					</div>
					<% if NewsFacts %>
						<div class="col-12 col-lg-6 offset-lg-1 py-3">
							<div class="factsBlock">
								<div class="row">
									<div class="col-12 fs-2-5rem fw-bold py-2">
										$FactsHeadline
									</div>
									<% loop NewsFacts %>
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
					<% end_if %>
				</div>
			</div>
			
		</div>
	</div>
</section>

<% include FeaturedBox linkLoop=$NewsFeaturedLink %>

<% include GalleryImages %>

<section class="py-3 py-lg-5- position-relative z-index-2 bg-white">
	<div class="container">
		<div class="row">
			<div class="col-12 text-secondary fs-2 fw-bold py-3">
				$GalleryHeadline
			</div>
			<div class="col-12 col-lg-11 offset-lg-1 py-3">
				<div class="row ">
					<div class="col-12 <% if GalleryText2 %>col-lg-5<% else %>col-lg-10<% end_if %> py-2">
						$GalleryText1
					</div>
					<% if GalleryText2 %>
						<div class="col-12 col-lg-5 offset-lg-1 py-2">
							$GalleryText2
						</div>
					<% end_if %>
				</div>
			</div>
		</div>
	</div>
</section>

<% include LastNewsBlock SubPages=1 %>