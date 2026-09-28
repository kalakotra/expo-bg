<% if TopVideo %>
	<div class="topVideo">
		<video width="100%" height="auto" autoplay muted playsinline class="d-block">
			<source src="$TopVideo.URL" type="video/mp4" />
		</video>
		<div class="topVideoText">
			<div class="container">
				<div class="row">
					<div class="col-9  col-lg-12 pagetitle">
						$PageTitle
					</div>
				</div>
			</div>
		</div>
	</div>
<% else %>
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
<% end_if %>

<section class="greybox pt-3 position-relative bg-white">
	<div class="container">
		<div class="row pt-3">
			<div class="col-12 text-secondary fs-2 py-3">
				$IntroSubline
			</div>
			<div class="col-12 col-lg-9 offset-lg-1 h1 py-3 pb-lg-5">
				$IntroText
			</div>
		</div>
	</div>
</section>


<section class="position-relative z-index-2 bg-white pt-5">
	<div class="container">
		<div class="row">
			<% loop Children %>
				<div class="col-12 $myColWidth  py-3" data-info="$Template">
					<div class="mybadge badge-$Category">
						<div class="badgeTitle">
							<% if Category='Menschen' %>
								<img src="$themedResourceURL('/images/group-icon.png')" alt="group icon" class="pe-2" />
								<%t JournalPage.Menschen "Menschen" %>
							<% else_if Category='Beziehungen' %>
								<img src="$themedResourceURL('/images/world-icon.png')" alt="world icon" class="pe-2" />
								<%t JournalPage.Beziehungen "Beziehungen" %>
							<% else %>
								<img src="$themedResourceURL('/images/idea-icon.png')" alt="idea icon" class="pe-2" />
								<%t JournalPage.Ideen "Ideen" %>
							<% end_if %>
						</div>
						<% if Template="Video with colored block" %>
							<% if PreviewVideo %>
								<div class="row h-100">
									<div class="col-12 col-lg-4 align-self-center">
										<div class="py-3 px-4 ">
											<div class="pb-3 fs-3-125rem text-white lh-1 titleShadow">$PreviewTitle</div>
											<a href="$Link" class="btn btn-primary"><%t JournalPage.MoreLink "MEHR DAZU" %></a>
										</div>
									</div>
									<div class="col-12 col-lg-8 position-relative prevVideoHolder">
										<video muted="" class="h-100 w-100 vFPopup" <% if PreviewImage %>poster="$PreviewImage.URL" <% end_if %> data-bs-toggle="modal" data-bs-target="#modealVideo_$ID">
											<source src="$PreviewVideo.URL" type="video/mp4">
										</video>
										<a class="vFPopup big" data-bs-toggle="modal" data-bs-target="#modealVideo_$ID"><img src="$themedResourceURL('/images/icons/play_white.png')"></a>
									</div>

								</div>
							<% else %>
								<div class="row h-100 align-items-center <% if PreviewImage %>background-cover<% end_if %>" <% if PreviewImage %>style="background-image: url($PreviewImage.URL);"<% end_if %> >
									<div class="col-12">
										<div class="py-3 px-4 fs-3-125-rem text-white">
											<div class="pb-3 fs-3-125rem text-white lh-1 titleShadow">$PreviewTitle</div>
											<a href="$Link" class="btn btn-primary"><%t JournalPage.MoreLink "MEHR DAZU" %></a>
										</div>
									</div>
								</div>
							<% end_if %>
						<% else_if Template="Full width Video" %>
							<% if PreviewVideo %>
								<div class="prevVideoHolder position-relative h-100">
									<video muted="" class="h-100 w-100" <% if PreviewImage %>poster="$PreviewImage.URL" <% end_if %>>
										<source src="$PreviewVideo.URL" type="video/mp4">
									</video>
									<div class="textOverVideo">
										<div class="row h-100">
											<div class="col-12 col-lg-4 align-self-center">
												<div class="py-3 px-4 ">
													<div class="pb-3 fs-3-125rem text-white lh-1 titleShadow">$PreviewTitle</div>
													<a href="$Link" class="btn btn-primary"><%t JournalPage.MoreLink "MEHR DAZU" %></a>
												</div>
											</div>
										</div>
									</div>
									<a class="vFPopup" data-bs-toggle="modal" data-bs-target="#modealVideo_$ID"><img src="$themedResourceURL('/images/icons/play_white.png')"></a>
								</div>
							<% else %>
								<div class="row h-100 align-items-center <% if PreviewImage %>background-cover<% end_if %>" <% if PreviewImage %>style="background-image: url($PreviewImage.URL);"<% end_if %>  data-info="fWVnV $PreviewVideo.ID">
									<div class="col-12">
										<div class="py-3 px-4 fs-3-125-rem text-white">
											<div class="pb-3 fs-3-125rem text-white lh-1 titleShadow">$PreviewTitle</div>
											<a href="$Link" class="btn btn-primary"><%t JournalPage.MoreLink "MEHR DAZU" %></a>
										</div>
									</div>
								</div>
							<% end_if %>
						<% else %>
							<% if PreviewVideo %>
								<div class="prevVideoHolder position-relative h-100">
									<div class="row h-100 align-items-center <% if PreviewImage %>background-cover<% end_if %>" <% if PreviewImage %>style="background-image: url($PreviewImage.URL);"<% end_if %> >
										<div class="col-12">
											<div class="py-3 px-4 fs-3-125-rem text-white">
												<div class="pb-3 fs-3-125rem text-white lh-1 titleShadow">$PreviewTitle</div>
												<a href="$Link" class="btn btn-primary"><%t JournalPage.MoreLink "MEHR DAZU" %></a>
											</div>
										</div>
									</div>
									<a class="vFPopup small" data-bs-toggle="modal" data-bs-target="#modealVideo_$ID"><img src="$themedResourceURL('/images/icons/play_white.png')"></a>
								</div>
							<% else %>
								<div class="row h-100 align-items-center <% if PreviewImage %>background-cover<% end_if %>" <% if PreviewImage %>style="background-image: url($PreviewImage.URL);"<% end_if %> >
									<div class="col-12">
										<div class="py-3 px-4 fs-3-125-rem text-white">
											<div class="pb-3 fs-3-125rem text-white lh-1 titleShadow">$PreviewTitle</div>
											<a href="$Link" class="btn btn-primary"><%t JournalPage.MoreLink "MEHR DAZU" %></a>
										</div>
									</div>
								</div>
							<% end_if %>
						<% end_if %>
						<div class="badgeTags">
							<% loop NewsTags %>
								<span class="bg-white rounded-2">$Title</span>
							<% end_loop %>
						</div>
					</div>
				</div>
			<% end_loop %>
		</div>
	</div>
</section>

<% loop Children %>
	<% if PreviewVideo %>
		<div class="modal fade" id="modealVideo_$ID" tabindex="-1" aria-labelledby="modealVideo_$IDLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-xl">
				<div class="modal-content">
					<div class="modal-body bg-primary rounded-3">
						<button class="close btn btn-primary position-absolute z-index-2 vModal" data-bs-dismiss="modal" aria-label="Close" data-video="#Video_$ID"><i class="fas fa-times-circle"></i></button>
						<video muted="" controls width="100%" id="Video_$ID">
							<source src="$PreviewVideo.URL" type="video/mp4">
						</video>
					</div>
				</div>
			</div>
		</div>
	<% end_if %>
<% end_loop %>