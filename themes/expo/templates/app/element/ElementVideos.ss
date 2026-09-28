<% if $Videos %>
    <div class="block block--child-pages bg-dark">
        <div class="container">
            <div class="row">
                <div class="col-12 ">
                    <% if $ShowTitle && $Title %>
                        <h2 class="block-headline font-trois text-white py-3">$Title</h2>
                    <% end_if %>
                </div>
                <% loop $Videos %>
                    <div class="col-12 col-md-6- col-lg-6 col-xl-4 col-3xl-3 py-3">
                        <% include VideoCard HolderID=$Up.Anchor %>
                    </div>
                <% end_loop %>
            </div>
        </div>
    </div>
<% end_if %>