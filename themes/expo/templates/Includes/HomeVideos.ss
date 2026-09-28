<% if $Locale='de_AT' %>

	<% if Videos %>
		<div class="col-12 col-lg-6 offset-lg-1  order-1 order-lg-2" data-info="$Locale">
			<div class="vid-container">
				<div class="videos videosTemplate-{$Videos.count} row">
					<div class=" py-3 col-12 
						<% if $Videos.count = 3 %>
							col-lg-8
						<% else_if $Videos.count = 2 %>
							col-lg-6
						<% else_if $Videos.count > 3 %>
							col-lg-6
						<% end_if %>
					">
						<% loop Videos.sort("SortOrder") %>

							<div class="video anim position-relative" style="--delay: .4s">
								<div class="video-wrapper">
									<video muted playsinline>
										<source src="$URL" type="video/mp4">
									</video>
								</div>
								<div class="video-name"><span>$Title</span></div>
							</div>
							<% if $Top.Videos.count = 3 %>
								<% if First %>
									</div><div class="col-12 col-lg-4  py-3">
								<% end_if %>
							<% else_if $Top.Videos.count = 2 %>
								<% if First %>
									</div><div class="col-12 col-lg-6  py-3">
								<% end_if %>
							<% else_if $Top.Videos.count > 3 %>
								<% if not last %>
									</div><div class="col-12 col-lg-6  py-3">
								<% end_if %>
							<% end_if %>
						<% end_loop %>
					</div>
				</div>

				<div class="stream-area animated">
					<button class="close btn btn-primary"><i class="fas fa-times-circle"></i></button>
					<div class="video-stream">
						<video id="the-video" class="video-js vjs-default-skin anim" width="940px" height="620px" controls preload="none" data-setup='{ "aspectRatio": "940:620", "playbackRates": [1, 1.5, 2], "fluid": true }' >
							<source src="$Videos.sort("SortOrder").First.URL" type='video/mp4' />
						</video>
					</div>
				</div>
			</div>
		</div>
	<% end_if %>

<% else %>

	<% if Videos_en %>
		<div class="col-12 col-lg-6 offset-lg-1  order-1 order-lg-2" data-info="$Locale">
			<div class="vid-container">
				<div class="videos videosTemplate-{$Videos.count} row">
					<div class=" py-3 col-12 
						<% if $Videos.count = 3 %>
							col-lg-8
						<% else_if $Videos.count = 2 %>
							col-lg-6
						<% else_if $Videos.count > 3 %>
							col-lg-6
						<% end_if %>
					">
						<% loop Videos_en.sort("SortOrder") %>

							<div class="video anim position-relative" style="--delay: .4s">
								<div class="video-wrapper">
									<video muted playsinline>
										<source src="$URL" type="video/mp4">
									</video>
								</div>
								<div class="video-name"><span>$Title</span></div>
							</div>
							<% if $Top.Videos_en.count = 3 %>
								<% if First %>
									</div><div class="col-12 col-lg-4  py-3">
								<% end_if %>
							<% else_if $Top.Videos_en.count = 2 %>
								<% if First %>
									</div><div class="col-12 col-lg-6  py-3">
								<% end_if %>
							<% else_if $Top.Videos_en.count > 3 %>
								<% if not last %>
									</div><div class="col-12 col-lg-6  py-3">
								<% end_if %>
							<% end_if %>
						<% end_loop %>
					</div>
				</div>

				<div class="stream-area animated">
					<button class="close btn btn-primary"><i class="fas fa-times-circle"></i></button>
					<div class="video-stream">
						<video id="the-video" class="video-js vjs-default-skin anim" width="940px" height="620px" controls preload="none" data-setup='{ "aspectRatio": "940:620", "playbackRates": [1, 1.5, 2], "fluid": true }' >
							<source src="$Videos_en.sort("SortOrder").First.URL" type='video/mp4' />
						</video>
					</div>
				</div>
			</div>
		</div>
	<% end_if %>

<% end_if %>