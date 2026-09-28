<div class="block block--media" id="$Anchor">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-12 ">
                <% if $ShowTitle && $Title %>
                    <h2 class="block-headline">$Title</h2>
                <% end_if %>
            </div>
            <div class="col-12 col-lg-6 py-3">
                <div class="embed-video">
                    $EmbedVideo.EmbedHTMLLazy
                </div>
            </div>
            <% if $Content %>
                <div class="col-12 col-lg-5 offset-lg-1 py-3">
                    $Content
                </div>
            <% end_if %>
        </div>
    </div>
</div>