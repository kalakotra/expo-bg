<div class="container-fluid <% if TopImage %>topimage<% else %>notopimage<% end_if %>" <% if TopImage %>style="background-image: url($TopImage.URL);"<% end_if %> aria-hidden="true">
    <div class="container">
        <div class="row">
            <div class="col-12 pagetitle">
                <h1>
                    <% if ClassName='FormularSubmission' %>
                        $getMyProdukt
                    <% else %>
                        <%t InnovationPage.PageTitle 'Innovationen Detail' %>
                    <% end_if %>
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
                    <div class="col-12 py-3 pb-lg-5 text-center">
                        $getMyLogo.Pad(250,250,FFFFFF,100)
                    </div>                 
					<div class="col-12 col-lg-5 py-3">
                        <h2>$getMyProdukt</h2>
                        <div class="row pt-3">
                            <div class="col-12 col-lg-5 pb-sm-1 pb-lg-2 pt-2 fw-bold">
                                <%t InnovationPage.Category 'Kategorie' %>
                            </div>
                            <div class="col-12 col-lg-7 pb-sm-3 pb-lg-2 pt-2">
                                $getMyCategory
                            </div>
                            <div class="col-12 col-lg-5 pb-sm-1 pb-lg-2 pt-2 fw-bold">
                                <%t InnovationPage.Schluesselworte 'Teaser' %>
                            </div>
                            <div class="col-12 col-lg-7 pb-sm-3 pb-lg-2 pt-2">
                                <% if $Locale='en_US' %>
                                    $Schluesselworte_en
                                <% else_if $Locale='ja_JP' %>
                                    $Schluesselworte_jp
                                <% else %>
                                    $Schluesselworte
                                <% end_if %>
                            </div>
                            <div class="col-12 col-lg-5 pb-sm-1 pb-lg-2 pt-2 fw-bold">
                                <%t InnovationPage.Ziel 'Ziele für nachhaltige Entwicklung' %>
                            </div>
                            <div class="col-12 col-lg-7 pb-sm-3 pb-lg-2 pt-2">
                                $getMyZiel
                            </div>
                            <div class="col-12 col-lg-5 pb-sm-1 pb-lg-2 pt-2 fw-bold">
                                <%t InnovationPage.Firma 'Unternehmen / Institution' %>
                            </div>
                            <div class="col-12 col-lg-7 pb-sm-3 pb-lg-2 pt-2">
                                <% if $Locale='en_US' %>
                                    $Firma_en
                                <% else_if $Locale='ja_JP' %>
                                    $Firma_jp
                                <% else %>
                                    $Firma
                                <% end_if %>
                            </div>
                            <div class="col-12 col-lg-5 pb-sm-1 pb-lg-2 pt-2 fw-bold">
                                <%t InnovationPage.Standort 'Standort' %>
                            </div>
                            <div class="col-12 col-lg-7 pb-sm-3 pb-lg-2 pt-2">
                                <% if $Locale='en_US' %>
                                    $Ort_en
                                <% else_if $Locale='ja_JP' %>
                                    $Ort_jp
                                <% else %>
                                    $Ort
                                <% end_if %>
                            </div>
                            <div class="col-12 col-lg-5 pb-sm-1 pb-lg-2 pt-2 fw-bold">
                                <%t InnovationPage.Website 'Website' %>
                            </div>
                            <div class="col-12 col-lg-7 pb-sm-3 pb-lg-2 pt-2">
                                <a href="$generateWebsiteLink" target="_blank" rel="nofolow">$getMyWebsite</a>
                            </div>
                        </div>
					</div>
                    
                    <div class="col-12 col-lg-6 offset-lg-1 py-3">
                        <% if $Video %>
                            <div class="videos position-relative roundedImage" data-info="$ClassName">
                                <div class="video-wrapper position-relative prevVideoHolder">
                                <video poster="<% if Poster %>$Poster.URL<% else %><% end_if %>" data-info="$SiteConfig.DefaultVideoPoster.URL" >
                                        <source src="$Video.URL" type="video/mp4">
                                    </video>
                                    <a class="vFPopup" data-bs-toggle="modal" data-bs-target="#modealVideo_$ID"><img src="$themedResourceURL('/images/icons/play_white.png')" class="noradius"></a>
                                </div>
                                <div class="video-name d-block"><span><% if $ClassName='FormularSubmission' %><% else %>$Video.Title<% end_if %></span></div>
                            </div>
                        <% else %>
                            <div class="previewNewsLink">$VisuelleDarstellung.First.Fill(580,350)</div>
                        <% end_if %>
                    </div>
				</div>
			</div>
			
		</div>
	</div>
</section>
<% if getMyVideo %>
    <div class="modal fade" id="modealVideo_$ID" tabindex="-1" aria-labelledby="modealVideo_$IDLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl">
            <div class="modal-content">
                <div class="modal-body bg-primary rounded-3">
                    <button class="close btn btn-primary position-absolute z-index-2 vModal" data-bs-dismiss="modal" aria-label="Close" data-video="#Video_$ID"><i class="fas fa-times-circle"></i></button>
                    <video controls width="100%" id="Video_$ID">
                        <source src="$getMyVideo.URL" type="video/mp4">
                    </video>
                </div>
            </div>
        </div>
    </div>
<% end_if %>

<% if getMyVisuelleDarstellung %>
	<section class="bg-white position-relative z-index-2 ">
		<div class="container-fluid py-5">
			<div class="row g-1">
                <% loop getMyVisuelleDarstellung %>
                    <div class="col-12 col-lg-auto">
                        <a href="$Me.URL" data-fancybox="gal" class="d-inline-block rounded-3 overflow-hidden mx-3" <% if TitleText %>title="$TitleText" data-caption="$TitleText"<% end_if %> >
                            $ScaleHeight(250)
                        </a>
                    </div>
                <% end_loop %>
			</div>
		</div>
	</section>
<% end_if %>

<section class="greybox pb-3 pt-3 mb-5 position-relative">
	<div class="container">
		<div class="row py-5">
			<div class="col-12 text-secondary fs-2 py-3">
				<%t InnovationPage.Einzigartig 'Was macht Ihre Innovation einzigartig?' %>
			</div>
			<div class="col-12 col-lg-9 offset-lg-1 py-3">
				$getMyStatus
			</div>
			<div class="col-12 text-secondary fs-2 py-3">
				<%t InnovationPage.Status 'Das Unternehmen' %>
			</div>
			<div class="col-12 col-lg-9 offset-lg-1 py-3">
				$getMyEinzigartig
			</div>
		</div>
	</div>
</section>