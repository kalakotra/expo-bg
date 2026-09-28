<div class="card card--video h-100 bg-dark animated">
    <div class="video-poster">
        <% if $Poster %>
            $Poster.FocusFill(425,416)
        <% else %>
            $SiteConfig.DefaultHeaderImage.FocusFill(425,416)
        <% end_if %>
        <img src="$themedResourceURL('/images/icons/play_white.png')" class="play-icon" alt="Play Video" loading='lazy' width='127' height='144' />
    </div>
    
    <div class="card-body">
        <div class="row g-2 align-items-center">
            <div class="col-8">
                <% if $Title %>
                    <h3 class="card-title">$Title</h3>
                <% end_if %>
            </div>
            <div class="col-4 text-end">
                <a class="vFPopup -stretched-link btn btn-arrow text-dark bg-white" data-bs-toggle="modal" data-bs-target="#modealVideo_{$HolderID}_$ID"></a>
            </div>
        </div>
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