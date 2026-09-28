<div class="block block--cooperation">
    <div class="container">
        <div class="row align-items-center">
            <% if $ShowTitle && $Title %>
                <div class="col-12">
                    <h2 class="block-headline h3">$Title</h2>
                </div>
            <% end_if %>

            <div class="col-12 col-lg-10 pb-lg-5 pt-5">
                <div class="row CooperationBoxRow g-0">
                    <% loop getInnovations %>
                        <div class="col-12 col-lg-3">
                            <div class="CooperationBox">
                                <a href="$Link" class="stretched-link d-block z-index-3">
                                    <div class="p-2 text-center">
                                        <% if Logo %>
                                            $Logo.Pad(250,250,FFFFFF,100)
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
            
        </div>
    </div>
</div>