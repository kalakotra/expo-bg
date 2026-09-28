<% if TopImage %>
	<div class="container-fluid topimage" style="background-image: url($TopImage.URL);" aria-hidden="true">
		<div class="container">
			<div class="row">
				<div class="col-12 pagetitle">
					<% if PageTitle %>
                        $PageTitle
                    <% else %>
                        <h1>$Title</h1>
                    <% end_if %>
				</div>
			</div>
		</div>
	</div>
<% else %>
	<div class="container-fluid notopimage">
		<div class="container">
			<div class="row">
				<div class="col-12 pagetitle">
					<% if PageTitle %>
                        $PageTitle
                    <% else %>
                        <h1>$Title</h1>
                    <% end_if %>
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

<% if NoCategories %>
<div class=" py-3 py-lg-5 position-relative z-index-3 bg-white">
	<div class="container">
		<div class="row g-0 justify-content-between">
			<% loop Children %>
				<div class="col-12 col-md-6 col-lg-auto position-relative my-3">
                    <div class="partnerBox partnerBoxHover">
                        <a href="$Link" class="stretched-link d-block z-index-3">
                            <div>
                                $TeaserImage.FocusFill(575,362,FFFFFF,100)
                                <% if TeaserTitle %><div class="p-1 fw-bold text-center">$TeaserTitle</div><% end_if %>
                                <% if TeaserSubtitle %><div class="px-1 pb-1 text-center">$TeaserSubtitle</div><% end_if %>
                            </div>
                        </a>
                    </div>
                </div>
			<% end_loop %>
		</div>
	</div>
</div>
<% else %>
    <% loop ArtistCategory %>
        <% if getArtistPages %>
            <div class=" py-3 py-lg-5 position-relative z-index-3 bg-white">
                <div class="container">
                    <div class="row py-3">
                        <div class="col-12 text-secondary fs-2 fw-bold py-3 color-platin-">
                            $Title
                        </div>
                        <div class="col-12 col-lg-11 offset-lg-1">
                            $Text
                        </div>
                    </div>
                    <div class="row g-0">
                        <% loop getArtistPages %>
                            <div class="col-12 col-md-6 col-lg-3 position-relative">
                                <div class="partnerBox partnerBoxHover">
                                    <a href="$Link" class="stretched-link d-block z-index-3">
                                        <div>
                                            $TeaserImage.FocusFill(575,362,FFFFFF,100)
                                            <% if TeaserTitle %><div class="p-1 fw-bold">$TeaserTitle</div><% end_if %>
                                            <% if TeaserSubtitle %><div class="px-1 pb-1">$TeaserSubtitle</div><% end_if %>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        <% end_loop %>
                    </div>
                </div>
            </div>
        <% end_if %>
    <% end_loop %>
<% end_if %>
