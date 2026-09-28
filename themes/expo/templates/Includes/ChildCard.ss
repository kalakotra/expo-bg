<div class="card card--child-page h-100 bg-dark animated">
    <div class="clipped-image ">
        <% if $PreviewImage %>
            $PreviewImage.FocusFill(425,396)
        <% else %>
            <% if HeaderImage %>
                $HeaderImage.FocusFill(425,396)
            <% else %>
                $SiteConfig.DefaultHeaderImage.FocusFill(425,396)
            <% end_if %>
        <% end_if %>
    </div>
    
    <div class="card-body">
        <div class="row g-2 align-items-center">
            <div class="col-8">
                <% if $PressDate %>
                    <p class="card-text press-date mb-2">$PressDate.Nice</p>
                <% end_if %>
                <% if $PreviewSubtitle %>
                    <p class="card-text mb-2">$PreviewSubtitle</p>
                <% end_if %>
                <h3 class="card-title h4"><% if $PreviewTitle %>$PreviewTitle<% else %>$Title<% end_if %></h3>
            </div>
            <div class="col-4 text-end">
                <a href="$Link" class="-stretched-link btn btn-arrow text-dark bg-white"></a>
            </div>
        </div>
    </div>
    
</div>