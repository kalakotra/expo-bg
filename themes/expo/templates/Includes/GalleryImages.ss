<% if GalleryImages %>
	<section class="bg-white position-relative z-index-2 ">
		<div class="container-fluid pt-5 pb-3">
			<div class="row">
				<div class="col-12">
					<div id="slickGallery">
						<% loop GalleryImages.sort(SortOrder) %>
							<div>
								<a href="$Me.URL" data-fancybox="gal" class="d-inline-block rounded-3 overflow-hidden mx-3" <% if TitleText %>title="$TitleText" data-caption="$TitleText"<% end_if %> >
									$ScaleHeight(250)
								</a>
							</div>
						<% end_loop %>
					</div>
				</div>
			</div>
		</div>
	</section>
<% end_if %>