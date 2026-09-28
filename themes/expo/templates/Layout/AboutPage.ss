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
			<% if CustomCode %>
				<div class="col-22">
					$CustomCode
				</div>
			<% end_if %>
		</div>
	</div>
</div>

<% include FeaturedBox linkLoop=$FeaturedLinks %>

<% include GalleryImages %>

<% if TimelineProjects %>
	<section class="bg-white position-relative z-index-2">
		<div class="container pb-5-">
			<div class="row pb-5-">
				<div class="col-12 text-secondary fs-2 fw-bold py-3">
					$ProjekteHeadline
				</div>
				<div class="col-12 col-lg-11 offset-lg-1 h1 py-3">
					$TimelineHeadline		
				</div>
			
				<div class="col-12 col-lg-11 offset-lg-1 py-3">
					<div class="accordion" id="accordionTimeline">
						<% loop TimelineProjects %>
							<div class="accordion-item">
								<div class="row">
									<div class="col-auto button-holder py-3 <% if First %>firstButton<% end_if %> <% if Last %>lastButton<% end_if %>">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target=".accordionTimelineContent$Pos(1)" aria-expanded="false" aria-controls="accordionTimelineContent$Pos(1)">
										</button>
									</div>
									<div class="col-7 col-md-8 col-lg-10  py-3">
										<div class="text-secondary lh-1 fs-2 pt-3" >$Year</div>
										<div class=" lh-1 fs-2" type="button" data-bs-toggle="collapse" data-bs-target=".accordionTimelineContent$Pos(1)" aria-expanded="false" aria-controls="accordionTimelineContent$Pos(1)">$Caption</div>
										<% if Headline %><div class="col-12 fw-bolder pb-3">$Headline</div><% end_if %>
										<div class="d-none d-lg-block">
											<div class="accordion-collapse collapse p-4 accordionTimelineContent$Pos(1)">
												<div class="row pb-3 pb-lg-5">
													
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
	</section>
<% end_if %>

<% if ClassName=ProgrammPage %>
	<% include LastNewsBlock %>
<% end_if %>