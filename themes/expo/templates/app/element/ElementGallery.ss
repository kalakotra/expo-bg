<% if $Image %>
    <div class="block block--gallery">
        <div class="container">
            <div class="row align-items-center">
                <% if $ShowTitle && $Title %>
                    <div class="col-12">
                        <h2 class="block-headline h3">$Title</h2>
                    </div>
                <% end_if %>
                
                <div class="col-12 col-lg-12">
                    <div id="slickGallery-{$ID}">
						<% loop Image.sort(SortOrder) %>
							<div>
								<a href="$Me.URL" data-fancybox="gal-{$Up.ID}" class="d-inline-block rounded-3 overflow-hidden mx-3"  >
									$ScaleHeight(250)
								</a>
							</div>
						<% end_loop %>
					</div>
                </div>
            </div>
        </div>
    </div>
<% end_if %>