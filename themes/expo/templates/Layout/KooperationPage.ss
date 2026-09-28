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
<div class="pb-3 pb-lg-5 position-relative z-index-3">
	<div class="container">
		<div class="row">
			<div class="col-12 text-right">
				<% include BreadCrumbs %>
			</div>
		</div>
		<div class="row pt-5-">
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
			
		</div>
	</div>
</div>
<% if Children.filter('Category', 'Platin') %>
<div class=" py-3 py-lg-5 position-relative z-index-3 bg-white">
	<div class="container">
		<div class="row py-3">
			<div class="col-12 text-secondary fs-2 fw-bold py-3 color-platin">
				<i class="far fa-trophy-alt fa-lg"></i> Platin
			</div>
			<div class="col-12 col-lg-11 offset-lg-1">
				$PlatinText
			</div>
		</div>
		<div class="row g-0">
			<% loop Children.filter('Category', 'Platin') %>
				<div class="col-12 col-md-6 col-lg-3 position-relative">
					<div class="partnerBox partnerBoxHover">
						<a href="$Link" class="stretched-link d-block z-index-3">
							<div class="p-2 text-center">
								<% if Logo %>
									$Logo.Pad(250,250,FFFFFF,100)
								<% else %>
									<img src="$themedResourceURL('images/blank.png')" alt="$Title" loading='lazy' width='250' height='250' />
								<% end_if %>
							</div>
						</a>
					</div>
				</div>
			<% end_loop %>
		</div>
	</div>
</div>
<% end_if %>

<% if Children.filter('Category', 'Gold') %>
<div class=" py-3 py-lg-5 position-relative z-index-3 bg-white">
	<div class="container">
		<div class="row py-3">
			<div class="col-12 text-secondary fs-2 fw-bold py-3 color-gold">
				<i class="far fa-award fa-lg"></i> Gold
			</div>
			<div class="col-12 col-lg-11 offset-lg-1">
				$GoldText
			</div>
		</div>
		<div class="row g-0">
			<% loop Children.filter('Category', 'Gold') %>
				<div class="col-12 col-md-6 col-lg-3 position-relative">
					<div class="partnerBox partnerBoxHover">
						<a href="$Link" class="stretched-link d-block z-index-3">
							<div class="p-2 text-center">
								<% if Logo %>
									$Logo.Pad(250,250,FFFFFF,100)
								<% else %>
									<img src="$themedResourceURL('images/blank.png')" alt="$Title" loading='lazy' width='250' height='250' />
								<% end_if %>
							</div>
						</a>
					</div>
				</div>
			<% end_loop %>
		</div>
	</div>
</div>
<% end_if %>



<% if Children.filter('Category', 'Silber') %>
	<div class=" py-3 py-lg-5 position-relative z-index-3 bg-white">
		<div class="container">
			<div class="row py-3">
				<div class="col-12 text-secondary fs-2 fw-bold py-3 color-Silber">
					<i class="far fa-award fa-lg"></i> <%t KooperationPartnerPage.Silber 'Silber' %>
				</div>
				<div class="col-12 col-lg-11 offset-lg-1">
					$SilberText
				</div>
			</div>
			<div class="row g-0">
				<% loop Children.filter('Category', 'Silber') %>
					<div class="col-12 col-md-6 col-lg-3 position-relative">
						<div class="partnerBox partnerBoxHover">
							<a href="$Link" class="stretched-link d-block z-index-3">
								<div class="p-2 text-center">
									<% if Logo %>
										$Logo.Pad(250,250,FFFFFF,100)
									<% else %>
										<img src="$themedResourceURL('images/blank.png')" alt="$Title" loading='lazy' width='250' height='250' />
									<% end_if %>
								</div>
							</a>
						</div>
					</div>
				<% end_loop %>
			</div>
		</div>
	</div>
<% end_if %>

	

<% if Children.filter('Category', 'Bronze') %>
	<div class=" py-3 py-lg-5 position-relative z-index-3 bg-white">
		<div class="container">
			<div class="row py-3">
				<div class="col-12 text-secondary fs-2 fw-bold py-3 color-Bronze">
					<i class="far fa-award fa-lg"></i> <%t KooperationPartnerPage.Bronze 'Bronze' %>
				</div>
				<div class="col-12 col-lg-11 offset-lg-1">
					$BronzeText
				</div>
			</div>
			<div class="row g-0">
				<% loop Children.filter('Category', 'Bronze') %>
					<div class="col-12 col-md-6 col-lg-3 position-relative">
						<div class="partnerBox partnerBoxHover">
							<a href="$Link" class="stretched-link d-block z-index-3">
								<div class="p-2 text-center">
									<% if Logo %>
										$Logo.Pad(250,250,FFFFFF,100)
									<% else %>
										<img src="$themedResourceURL('images/blank.png')" alt="$Title" loading='lazy' width='250' height='250' />
									<% end_if %>
								</div>
							</a>
						</div>
					</div>
				<% end_loop %>
			</div>
		</div>
	</div>
<% end_if %>

	

<% if Children %><% else %>
<div class=" py-3 py-lg-5- position-relative z-index-3 d-none">
	<div class="container">
		<div class="row">
			<div class="col-12 text-secondary fs-2 fw-bold py-3">
				$PartnerHeadline
			</div>

			<% loop Children %>
				<div class="col-12 col-md-6 col-lg-4 pb-4 py-2">
					<div class="prodbox">
						<a href="$Me.Link" class="stretched-link">$TopImage.FocusFill(575,362)</a>
						<div>
							<div>
								<span>$Title</span><br>
								$Subline
							</div>
						</div>
					</div>
				</div>
			<% end_loop %>
		</div>
	</div>
</div>

<% include InvolvedBox %>


<% include LastNewsBlock %>
<% end_if %>