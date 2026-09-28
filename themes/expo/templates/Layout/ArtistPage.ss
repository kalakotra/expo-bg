<div class="container-fluid <% if TopImage %>topimage<% else %>notopimage<% end_if %>" <% if TopImage %>style="background-image: url($TopImage.URL);"<% end_if %> aria-hidden="true">
    <div class="container">
        <div class="row">
            <div class="col-12 pagetitle">
                <h1>
                    $Title
                </h1>
            </div>
        </div>
    </div>
</div>
<section class="pb-3 pb-lg-5  position-relative z-index-2 bg-white">
	<div class="container">
		<div class="row">
			<div class="col-12 text-right">
				<% include BreadCrumbs %>
			</div>
		</div>
		<div class="row">
            <div class="col-12 col-lg-11 offset-lg-1">
				<div class="row py-3 py-lg-5">
                    <div class="col-12 <% if $Video %>col-lg-6<% end_if %> py-3">
                        <h2>$Title</h2>
                        $Content
					</div>
                    <% if $Video %>
                        <div class="col-12 col-lg-5 offset-lg-1 py-3">
                            
                                <div class="videos position-relative roundedImage" data-info="$ClassName">
                                    <div class="video-wrapper position-relative prevVideoHolder">
                                        <video poster="<% if Poster %>$Poster.URL<% else %><% end_if %>" >
                                            <source src="$Video.URL" type="video/mp4">
                                        </video>
                                        <a class="vFPopup" data-bs-toggle="modal" data-bs-target="#modealVideo_$ID"><img src="$themedResourceURL('/images/icons/play_white.png')" class="noradius"></a>
                                    </div>
                                    <div class="video-name d-block"><span>$Video.Title</span></div>
                                </div>
                            
                        </div>
                    <% end_if %>
				</div>
			</div>
			
		</div>
	</div>
</section>
<% if Video %>
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
<% end_if %>

<% if Images %>
	<section class="bg-white position-relative z-index-2 ">
		<div class="container-fluid py-5">
			<div class="row g-1">
                <% loop Images.sort('SortOrder') %>
                    <div class="col-12 col-lg-auto">
                        <a href="$Me.URL" data-fancybox="gal" class="d-inline-block rounded-3 overflow-hidden mx-3" >
                            $ScaleHeight(250)
                        </a>
                    </div>
                <% end_loop %>
			</div>
		</div>
	</section>
<% end_if %>

<% if Content2 %>
<section class="greybox pb-3 pt-3 mb-5 position-relative">
	<div class="container">
		<div class="row py-5">
			<div class="col-12 col-lg-9 offset-lg-1 py-3">
				$Content2
			</div>
		</div>
	</div>
</section>
<% end_if %>