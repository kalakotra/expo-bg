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
		<div class="row py-3">
			<div class="col-12 col-lg-11 offset-lg-1">
				<div class="row ">
					<div class="col-12 col-lg-5 py-3">
                        <div class="pb-3">$Logo</div>
						$Content
					</div>
					<div class="col-12 col-lg-6 offset-lg-1 py-3">
						<div class="factsBlock">
							<div class="row">
								<div class="col-12 fs-2 fw-bold py-2 pb-4 color-{$Category} <% if Category='Platin' %>color-platin-<% else %>color-gold-<% end_if %>">
									<% if Category='Platin' %>
                                        <i class="far fa-trophy-alt fa-lg"></i>
                                    <% else %>
                                        <i class="far fa-award fa-lg"></i>
                                    <% end_if %>
									
									<% if Category='Platin' %>
										<%t KooperationPartnerPage.Platin 'Platin' %>
									<% else_if Category='Gold' %>
										<%t KooperationPartnerPage.Gold 'Gold' %>
									<% else_if Category='Silber' %>
										<%t KooperationPartnerPage.Silber 'Silber' %>
									<% else_if Category='Bronze' %>
										<%t KooperationPartnerPage.Bronze 'Bronze' %>
									<% end_if %>
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

<section class="greybox pb-3 pt-3 mb-5 position-relative">
	<div class="container">
		<div class="row py-5">
			<div class="col-12 text-secondary fs-2 py-3">
				$BottomHeadline
			</div>
			<div class="col-12 col-lg-11 offset-lg-1 py-3">
				<div class="row">
                    <div class="col-12 col-lg-5 py-3">
                        $BottomContent

                        <% if KooperationPartnerLink %>
							<% loop KooperationPartnerLink %>
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
                    <div class="col-12 col-lg-6 offset-lg-1 py-3 previewNewsLink">
                        $BottomImage
                    </div>
                </div>
			</div>
		</div>
	</div>
</section>
<% include GalleryImages %>
<% include LastNewsBlock SubPages=1 %>