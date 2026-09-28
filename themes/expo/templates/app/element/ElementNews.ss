<% if $getLastNews %>
    <div class="block block--child-pages bg-dark">
        <div class="container">
            <div class="row align-items-center ">
                <div class="col-12 col-md-8 col-lg-9">
                    <% if $ShowTitle && $Title %>
                        <h2 class="block-headline font-trois text-white py-3">$Title</h2>
                    <% end_if %>
                </div>
                <div class="col-12 col-md-4 col-lg-3 py-3 text-end">
                    <% if $ShowShowAllLink %>
                        <% with $getLastNews.First %>
                            <a href="$Link" class="btn btn-arrow btn-light"><%t Page.SeeAllNews 'ALLE NEWS' %></a>
                        <% end_with %>
                    <% end_if %>
                </div>
                <div class="w-100">
                </div>
                <% loop $getLastNews %>
                    <div class="col-12 col-md-6- col-lg-6 col-xl-4 col-3xl-3 py-3">
                        <% include ChildCard %>
                    </div>
                <% end_loop %>
            </div>
        </div>
    </div>
<% end_if %>