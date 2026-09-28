<% if SeparatorImage %>
    <div class="block block--separator-image">
        $SeparatorImage.FocusFill(1920, 570)
    </div>
<% end_if %>
<div class="block block--cta <% if $DarkTheme %>bg-dark<% end_if %>">
    <div class="container">
        <div class="row align-items-center justify-content-center">
            <% if $Image1 %>
            <div class="col-12 col-xl-3 text-center pt-lg-5">
                <div class="clipped-image-holder pt-lg-5">$Image1.FocusFill(330,320)</div>
            </div>
            <% end_if %>
            <div class="col-12 <% if $Image1 && $Image2 %>col-xl-6<% else %>col-xl-10<% end_if %> py-5 <% if $Centered %>text-center<% end_if %>">
                <div class="<% if $DarkTheme %>text-white<% end_if %>">
                    <% if $ShowTitle && $Title %>
                        <h2 class="block-headline <% if $DarkTheme %>text-white<% end_if %>">$Title</h2>
                    <% end_if %>
                    $Text
                </div>
                <% with $ElementLink %>
                    <% if $exists %>
                        <a href="$URL" class="btn <% if $Up.DarkTheme %>btn-light<% else %>btn-dark<% end_if %> btn-arrow mt-3" <% if $OpenInNew %>target="_blank" rel="noopener noreferrer"<% end_if %>>$Title</a>
                    <% end_if %>
                <% end_with %>
            </div>
            <% if $Image2 %>
            <div class="col-12 col-xl-3 text-center pb-lg-5 ">
                <div class="clipped-image-holder pb-lg-5">$Image2.FocusFill(330,320)</div>
            </div>
            <% end_if %>
        </div>
    </div>
</div>