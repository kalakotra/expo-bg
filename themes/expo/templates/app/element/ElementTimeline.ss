<% if $Items %>
    <div class="block block--timeline">
        <div class="container">
            <div class="row align-items-center">
				<% if Subtitle %>
					<div class="col-12">
						<p class="block-subtitle">$Subtitle</p>
					</div>
				<% end_if %>
                <% if $ShowTitle && $Title %>
                    <div class="col-12">
                        <h2 class="block-headline">$Title</h2>
                    </div>
                <% end_if %>
                
                <div class="col-12 col-lg-12">
                    <div class="accordion" id="accordionTimeline-$ID">
						<% loop Items %>
							<div class="accordion-item">
								<div class="row">
									<div class="col-auto button-holder py-3 <% if First %>firstButton<% end_if %> <% if Last %>lastButton<% end_if %>">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target=".accordionTimelineContent$Pos(1)" aria-expanded="false" aria-controls="accordionTimelineContent$Pos(1)">
										</button>
									</div>
									<div class="col-7 col-md-8 col-lg-10  py-3">
                                        <h3 class="accordion-year">$Year</h3>
										<h4 class="accordion-title" type="button" data-bs-toggle="collapse" data-bs-target=".accordionTimelineContent$Pos(1)" aria-expanded="false" aria-controls="accordionTimelineContent$Pos(1)">$Title</h4>
										<% if Subtitle %><p class="accordion-subtitle">$Subtitle</p><% end_if %>
										<div class="d-none d-lg-block">
											<div class="accordion-collapse collapse p-4 accordionTimelineContent$Pos(1)">
												<div class="row pb-3 pb-lg-5">
													
													<div class="col-12 <% if Image %>col-lg-8<% end_if %> accordion-description">
														$Description
													</div>
													<% if Image %>
														<div class="col-12 col-lg-4">
															<div class="rounded-3 overflow-hidden">$Image</div>
														</div>
													<% end_if %>
												</div>
											</div>
										</div>
									</div>
									<div class="col-12 col-lg-10 d-lg-none">
										<div class="accordion-collapse collapse p-4 accordionTimelineContent$Pos(1)">
											<div class="row pb-3 pb-lg-5">
												<% if Headline %><div class="col-12 fw-bolder pb-3">$Headline</div><% end_if %>
												<div class="col-12 <% if Image %>col-lg-8<% end_if %> lh-sm">
													$Text
												</div>
												<% if Image %>
													<div class="col-12 col-lg-4">
														<div class="rounded-3 overflow-hidden">$Image</div>
													</div>
												<% end_if %>
											</div>
										</div>
									</div>
								</div>
							</div>
						<% end_loop %>
					</div>
                </div>
            </div>
        </div>
    </div>
<% end_if %>