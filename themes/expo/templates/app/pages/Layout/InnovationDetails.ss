<% include HeaderImage %>
<main class="block block--content" role="main">
	<% include BreadCrumbs  %>
    <% with $Innovation %>
        <div class="container">
            <% if Logo %>
                <div class="innovation-logo text-center">
                    $Logo.Pad(250,250)
                </div>
            <% end_if %>
            <div class="row">
                <div class="col-12 <% if Video %>col-xl-6<% end_if %> py-3 py-lg-5">
                    <div class="card card--cooperation">
                        <div class="card-body">
                            <h2 class="card-title font-trois">$Company</h2>
                            
                            <div class="row">
                                <div class="col-12 col-lg-5 py-1 py-md-3 fw-bold">
                                    <%t InnovationDetails.InnovationCategory "Kategorie" %>
                                </div>
                                <div class="col-12 col-lg-7 py-1 py-md-3 ">
                                    $InnovationCategory.Title
                                </div>
                                <div class="col-12 col-lg-5 py-1 py-md-3 fw-bold">
                                    <%t InnovationDetails.ShortDescription "Teaser" %>
                                </div>
                                <div class="col-12 col-lg-7 py-1 py-md-3 ">
                                    $ShortDescription
                                </div>
                                <div class="col-12 col-lg-5 py-1 py-md-3 fw-bold">
                                    <%t InnovationDetails.City "Standort" %>
                                </div>
                                <div class="col-12 col-lg-7 py-1 py-md-3 ">
                                    $City
                                </div>
                                <div class="col-12 col-lg-5 py-1 py-md-3 fw-bold">
                                    <%t InnovationDetails.Website "Website" %>
                                </div>
                                <div class="col-12 col-lg-7 py-1 py-md-3 ">
                                    $Website
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <% if Video %>
                    <div class="col-12 col-xl-6 py-3 py-lg-5">
                        <div class="card card--video h-100 bg-dark animated">
                            <div class="video-poster">
                                <a class="vFPopup" data-bs-toggle="modal" data-bs-target="#modealVideo_{$HolderID}_$ID">
                                    <% if $Poster %>
                                        $Poster.FocusFill(425,416)
                                    <% else %>
                                        $Logo.FocusFill(425,416)
                                    <% end_if %>
                                    <img src="$themedResourceURL('/images/icons/play_white.png')" class="play-icon" alt="Play Video" loading='lazy' width='127' height='144' />
                                </a>
                            </div>
                            
                        </div>
                        <div class="modal fade" id="modealVideo_{$HolderID}_$ID" tabindex="-1" aria-hidden="true" data-bs-backdrop="static">
                            <div class="modal-dialog modal-dialog-centered modal-xl">
                                <div class="modal-content">
                                    <div class="modal-body bg-primary rounded-3">
                                        <button class="close btn btn-primary position-absolute z-index-2 vModal" data-bs-dismiss="modal" aria-label="Close" data-video="#Video_{$HolderID}_$ID"><i class="fas fa-times-circle"></i></button>
                                        <video controls width="100%" id="Video_{$HolderID}_$ID">
                                            <source src="$Video.URL" type="video/mp4">
                                        </video>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <% end_if %>
            </div>
        </div>
        <% if $Images %>
            <div class="block block--gallery">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12 col-lg-12">
                            <div id="slickGallery-{$ID}">
                                <% loop Images %>
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

        <% if $LongDescription %>
            <div class="block block--long-description">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <h2 class="h5 font-trois title-color"><%t InnovationDetails.LONGDESCRIPTION 'Beschreibung des konkreten Nutzens und der Zielgruppe' %></h2>
                        </div>
                        <div class="col-12 col-lg-9 offset-lg-1">
                            <div class="content">$LongDescription</div>
                        </div>
                    </div>
                </div>
            </div>
        <% end_if %>

        <% if $MarketInfo %>
            <div class="block block--long-description">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <h2 class="h5 font-trois title-color"><%t InnovationDetails.MARKETINFO 'Angaben zur Marktreife und bisherigen Anwendung' %></h2>
                        </div>
                        <div class="col-12 col-lg-9 offset-lg-1">
                            <div class="content">$MarketInfo</div>
                        </div>
                    </div>
                </div>
            </div>
        <% end_if %>

        <% if $DevelopmentInfo %>
            <div class="block block--long-description">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <h2 class="h5 font-trois title-color"><%t InnovationDetails.DEVELOPMENTINFO 'Angaben zum Entwicklungsstand und zur Weiterentwicklung' %></h2>
                        </div>
                        <div class="col-12 col-lg-9 offset-lg-1">
                            <div class="content">$DevelopmentInfo</div>
                        </div>
                    </div>
                </div>
            </div>
        <% end_if %>

        <% if $TargetGroup %>
            <div class="block block--long-description">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <h2 class="h5 font-trois title-color"><%t InnovationDetails.TARGETGROUP 'Beschreibung der Zielgruppe' %></h2>
                        </div>
                        <div class="col-12 col-lg-9 offset-lg-1">
                            <div class="content">$TargetGroup</div>
                        </div>
                    </div>
                </div>
            </div>
        <% end_if %>

        <% if $LongDescription %>
            <div class="block block--long-description">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <h2 class="h5 font-trois title-color"><%t InnovationDetails.LONGDESCRIPTION 'Beschreibung des konkreten Nutzens und der Zielgruppe' %></h2>
                        </div>
                        <div class="col-12 col-lg-9 offset-lg-1">
                            <div class="content">$LongDescription</div>
                        </div>
                    </div>
                </div>
            </div>
        <% end_if %>
    <% end_with %>
</main>
