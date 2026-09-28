<div class="block block--facts">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="bg-dark rounded-3 py-5 px-5">
                    <div class="row">
                        <% if $ShowTitle && $Title %>
                            <div class="col-12 col-xl-9">
                                <h2 class="block-headline h3">$Title</h2>
                            </div>
                        <% end_if %>
                        <div class="col-12 col-lg-4 text-center">
                            $Icon1
                            <div class="countMe" data-from="0" data-to="$Value1" data-speed="3000">$Value1</div>
                            <div class="fact-title">$Title1</div>
                        </div>
                        <div class="col-12 col-lg-4 text-center">
                            $Icon2
                            <div class="countMe" data-from="0" data-to="$Value2" data-speed="3000">$Value2</div>
                            <div class="fact-title">$Title2</div>
                        </div>
                        <div class="col-12 col-lg-4 text-center">
                            $Icon3
                            <div class="countMe" data-from="0" data-to="$Value3" data-speed="3000">$Value3</div>
                            <div class="fact-title">$Title3</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>