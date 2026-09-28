<% include HeaderImage %>
<main class="block block--content" role="main">
    <% include BreadCrumbs %>
	<div class="container">
		<div class="row">
			<div class="col-12 col-xl-9">
				<article>
					<h1 class="font-trois title-color">$Title</h1>
					<div class="content">$Content</div>
				</article>
			</div>
		</div>
	</div>
</main>

<section class="block block--cooperation">
    <div class="container">
        <div class="row">
            <div class="col-12 col-xl-5 py-3">
                <% if $CooperationLogo %>
                    <div class="CooperationLogo">$CooperationLogo.ScaleMaxWidth(800)</div>
                <% end_if %>
                <% if $CooperationText %>
                    <div class="content">$CooperationText</div>
                <% end_if %>
            </div>
            <div class="col-12 col-xl-6 offset-xl-1 py-3">
                <div class="card card--cooperation">
                    <div class="card-body">
                        <% if $CooperationType %>
                            <h2 class="card-title font-trois"><div class="clipped-image">$CooperationType.Icon</div> $CooperationType.Title</h2>
                        <% end_if %>
                        <div class="row">
                            <% if $CooperationPartnership %>
                                <div class="col-12 col-lg-5 py-1 py-md-3 fw-bold">
                                    <%t CooperationPage.CooperationPartnership "Partnerschaft" %>
                                </div>
                                <div class="col-12 col-lg-7 py-1 py-md-3 ">
                                    $CooperationPartnership
                                </div>
                            <% end_if %>
                            <% if $CooperationSector %>
                                <div class="col-12 col-lg-5 py-1 py-md-3 fw-bold">
                                    <%t CooperationPage.CooperationSector "Bereich" %>
                                </div>
                                <div class="col-12 col-lg-7 py-1 py-md-3 ">
                                    $CooperationSector
                                </div>
                            <% end_if %>
                            <% if $CooperationParner %>
                                <div class="col-12 col-lg-5 py-1 py-md-3 fw-bold">
                                    <%t CooperationPage.CooperationParner "Kooperationspartner" %>
                                </div>
                                <div class="col-12 col-lg-7 py-1 py-md-3 ">
                                    $CooperationParner
                                </div>
                            <% end_if %>
                            <% if $CooperationAddress %>
                                <div class="col-12 col-lg-5 py-1 py-md-3 fw-bold">
                                    <%t CooperationPage.CooperationAddress "Adresse" %>
                                </div>
                                <div class="col-12 col-lg-7 py-1 py-md-3 ">
                                    $CooperationAddress
                                </div>
                            <% end_if %>
                            <% if $CooperationWebseite %>
                                <div class="col-12 col-lg-5 py-1 py-md-3 fw-bold">
                                    <%t CooperationPage.CooperationWebseite "Webseite" %>
                                </div>
                                <div class="col-12 col-lg-7 py-1 py-md-3 ">
                                    $CooperationWebseite
                                </div>
                            <% end_if %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

$ElementalArea