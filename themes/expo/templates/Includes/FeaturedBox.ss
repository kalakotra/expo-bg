<% if linkLoop || $FeaturedText || $FeaturedHeadline %>
<section class="greybox">
	<div class="container">
		<div class="row justify-content-between">
			<div class="col-12 text-secondary fs-2 fw-bold  py-3">
				<div class="minus-l-100-">
					$FeaturedHeadline
				</div>
			</div>
			<div class="col-12 col-lg-11 offset-lg-1 ">
				<div class="row">
					<div class="col-12 col-lg-5 py-3 order-lg-1 order-2">
						$FeaturedText
						<% if linkLoop %>
							<% loop linkLoop %>
								<div>
									<% if Datei %>
										<a href="$Datei.URL" target="_blank" class="fs-4 text-primary">
											<i class="fal fa-arrow-to-bottom"></i>
											<span class="ps-2 ">$Caption</span>
											<span class="ps-2 d-none"><%t KooperationPage.Download "DOWNLOAD" %></span>
										</a>
									<% else %>
										<a href="$ExternalURL" target="_blank" rel="noopener" class="fs-4 text-primary">
											<i class="fal fa-external-link"></i>
											<span class="ps-2 ">$Caption</span>
											<span class="ps-2 d-none"><%t KooperationPage.ExternalLink "EXTERNAL LINK" %></span>
										</a>
									<% end_if %>
								</div>
							<% end_loop %>
						<% end_if %>
					</div>
					<div class="col-12 col-lg-6  offset-lg-1 FeaturedImage py-3 order-lg-2 order-1">
						$FeaturedImage
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<% end_if %>