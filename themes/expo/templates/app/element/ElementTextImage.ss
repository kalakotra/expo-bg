<div class="block block--content-image <% if BottomLogo %>has-bottom-logo<% end_if %>">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-12 col-lg-6 col-xl-4 offset-xl-1 <% if SwapImageAndText %>order-lg-2<% end_if %>">
                <% if $ShowTitle && $Title %>
                    <h2 class="block-headline h3">$Title</h2>
                <% end_if %>
                $HTML
            </div>
            <div class="col-12 col-lg-6 <% if SwapImageAndText %>order-lg-1<% else %>offset-xl-1<% end_if %>">
                $Image
            </div>
            <% if BottomLogo %>
                <div class="col-12 col-lg-4 offset-lg-8 bottom-logo order-3">
                    <img src="$themedResourceURL('/images/bildmarke.png')" alt="Expo 2027 Bildmarke" class="bildmarke" />
                </div>
            <% end_if %>
        </div>
    </div>
</div>