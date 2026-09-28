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
<div class="container-fluid relativer mb-5- z-index-2">
	<div class="container">
		<div class="row">
			<div class="col-12 text-right">
				<% include BreadCrumbs %>
			</div>
		</div>
		<div class="row">
			<div class="col-12 text-secondary fs-2 fw-bold py-3">
				$Subline
			</div>
			<div class="col-12 col-lg-11 offset-lg-1 py-3">
				$Content
			</div>
			
		</div>
	</div>
</div>

<div class=" py-3 py-lg-5- position-relative z-index-3 bg-white">
	<div class="container">
		<div class="row">
			<div class="col-12 text-secondary fs-2 fw-bold py-3">
				$PressreleasesHeadline
			</div>

			<% loop Children %>
				<div class="col-12 col-md-6 col-lg-4  py-3 position-relative">
					<div class="prodbox--">
						<a href="$Me.Link" class="stretched-link roundedImageChild">$TopImage.FocusFill(575,362)</a>
						<% if PressReleaseDate %>
							<div class="text-secondary fs-5 fw-400 pt-4">
								$PressReleaseDate.format('dd.MM.y')
							</div>
						<% end_if %>
						<div>$MenuTitle</div>
					</div>
				</div>
			<% end_loop %>
		</div>
	</div>
</div>


<section class="greybox position-relative z-index-3">
	<div class="container ">
		<div class="row">
			<div class="col-12 text-secondary fs-2 fw-bold py-3">
				$GalleryHeadline
			</div>
			<div class="col-12 col-lg-11 offset-lg-1 py-3">
				$GalleryText		
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-lg-11 offset-lg-1">
				<div class="row">
					<% loop PresseBilder %>
						<div class="col-lg-4 pt-3 pb-5 position-relative">
							<a href="<% if GalleryLink %>$GalleryLink<% else %>$Image.Link<% end_if %>" <% if GalleryLink %>rel="noopener" target="_blank"<% else %>data-fancybox="press-gallery" rel="gal"<% end_if %> class="stretched-link roundedImageChild" >
								$Image.FocusFill(515,320)<br>
								<span class="d-inline-block pt-3">$Caption</span>
							</a>
						</div>
					<% end_loop %>
				</div>
			</div>
		</div>
	</div>
</section>


<div class="container py-4 position-relative z-index-3 bg-white">
	<div class="row">
		<div class="col-12 text-secondary fs-2 fw-bold py-3">
			$VideosHeadline
		</div>
		<div class="col-12 col-lg-11 offset-lg-1 py-3">
			$VideosText		
		</div>
	</div>
	<div class="row pt-5">
		<div class="col-12 col-lg-11 offset-lg-1">			
				<% loop PresseVideos %>
					<div class="row  ">
						<div class="col-lg-4 py-3">
							<strong>$Caption</strong>
							$Text
						</div>
						<div class="col-lg-7 offset-lg-1 py-3">
							<div class="videos position-relative roundedImage">
								<div class="video-wrapper position-relative prevVideoHolder">
									<video <% if Poster %>poster="$Poster.URL"<% end_if %> >
										<source src="$Video.URL" type="video/mp4">
									</video>
									<a class="vFPopup" data-bs-toggle="modal" data-bs-target="#modealVideo_$ID"><img src="$themedResourceURL('/images/icons/play_white.png')" class="noradius"></a>
								</div>
								<div class="video-name"><span>$Video.Title</span></div>
							</div>
						</div>
					</div>
				<% end_loop %>
			</div>
		</div>
	</div>
</div>

<% if PresseVideos %>
	<% loop PresseVideos %>
		<div class="modal fade" id="modealVideo_$ID" tabindex="-1" aria-labelledby="modealVideo_$IDLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-xl">
				<div class="modal-content">
					<div class="modal-body bg-primary rounded-3">
						<button class="close btn btn-primary position-absolute z-index-2 vModal" data-bs-dismiss="modal" aria-label="Close" data-video="#Video_$ID"><i class="fas fa-times-circle"></i></button>
						<video controls width="100%" id="Video_$ID">
							<source src="$Video.URL" type="video/mp4">
						</video>
					</div>
				</div>
			</div>
		</div>
	<% end_loop %>
<% end_if %>
