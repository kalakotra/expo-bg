<div class="block block--cooperation">
    <div class="container">
        <div class="row align-items-center">
            <% if $ShowTitle && $Title %>
                <div class="col-12 py-3">
                    <h2 class="block-headline">$Title</h2>
                </div>
            <% end_if %>
            <% loop $CooperationTypes %>
                <% if getCooperationPages %>
                    <div class="col-12 col-lg-12 py-3">
                        <h3 class="card-title font-trois h2"><div class="clipped-image">$Icon</div> $Title</h3>
                        <div class="row">
                            <% if $Description1 %>
                                <div class="col-12 <% if $Description2 %>col-lg-4<% else %> col-lg-10 <% end_if %> offset-lg-1 py-1 py-md-3">
                                    $Description1
                                </div>
                                <div class="col-12 col-lg-1"></div>
                            <% end_if %>
                            <% if $Description2 %>
                                <div class="col-12 <% if $Description1 %>col-lg-4<% else %> col-lg-10 <% end_if %> offset-lg-1 py-1 py-md-3">
                                    $Description2
                                </div>
                            <% end_if %>
                        </div>
                    </div>
                    <div class="col-12 col-lg-10 pb-lg-5">
                        <div class="row CooperationBoxRow g-0">
                            <% loop getCooperationPages %>
                                <div class="col-12 col-lg-3">
                                    <div class="CooperationBox">
                                        <a href="$Link" class="stretched-link d-block z-index-3">
                                            <div class="p-2 text-center">
                                                <% if CooperationLogo %>
                                                    $CooperationLogo.Pad(250,250,FFFFFF,100)
                                                <% else %>
                                                    <img src="$themedResourceURL('images/blank.png')" alt="$Title" loading='lazy' width='250' height='250' />
                                                <% end_if %>
                                            </div>
                                            <span class="btn btn-dark btn-arrow"><%t Page.DETAILSLINK "Details" %></span>
                                        </a>
                                    </div>
                                </div>
                            <% end_loop %>
                        </div>
                    </div>
                <% end_if %>
            <% end_loop %>
        </div>
    </div>
</div>