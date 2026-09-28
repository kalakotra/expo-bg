<% if TopImage %>
	<div class="container-fluid topimage" style="background-image: url($TopImage.URL);" aria-hidden="true">
		<div class="container">
			<div class="row">
				<div class="col-12 pagetitle">
					$PageTitle
				</div>
			</div>
		</div>
	</div>
<% else %>
	<div class="container-fluid notopimage">
		<div class="container">
			<div class="row">
				<div class="col-12 pagetitle">
					$PageTitle
				</div>
			</div>
		</div>
	</div>
<% end_if %>
<div class="container-fluid relativer mb-5 z-index-2">
	<div class="container">
		<div class="row">
			<div class="col-12 text-right">
				<% include BreadCrumbs %>
			</div>
		</div>
		<div class="row pt-3">
			<div class="col-12 text-secondary fs-2 fw-bold py-3">
				$Subline
			</div>
			<div class="col-12 col-lg-11 offset-lg-1">
				<div class="row ">
					<div class="col-12 col-lg-5 py-3">
						$Content
					</div>
					<div class="col-12 col-lg-5 offset-lg-1 py-3">
						$Content2
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>

<div class=" py-3 py-lg-5 position-relative z-index-2 bg-white">
	<div class="container">
		<div class="row g-0 isotope-grid">
			<div class="col-12 isotope-filter pb-3">
				<button class="btn btn-outline-light py-2 px-4 mb-2 fs-4 text-body active" data-filter="*"><%t InnovationHolder.ShowAll "Alle" %></button>
				<% loop getInnovationGroupedList.GroupedBy("getMyCategory") %>
					<button class="btn btn-outline-light py-2 px-4 mb-2 fs-4 text-body" data-filter=".innoCat_{$Top.codeFromString($getMyCategory)}">
						<img src="/_resources/themes/expo/images/icons/{$Top.codeFromString($getMyCategory)}.svg" width="25" class="me-2" />$getMyCategory
					</button>
				<% end_loop %>
			</div>
			<% loop getMyClass("FormularSubmission").filter("Visible", "1").filter('IWant', '10').sort("Firma") %>
				<div class="col-12 col-md-6 col-lg-3 pb-4 py-2 position-relative innoCat_{$Top.codeFromString($getMyCategory)} isotope-item grid-sizer">
					<div class="partnerBox h-100 bg-light bg-opacity-25 text-center">
						<div class="bg-white">
							<a href="$Top.Link($myLink)" class="stretched-link">$getMyLogo.Pad(250,250,FFFFFF,100)</a>
						</div>
						<div class="text-center py-2 px-3">
                            <strong>
								<% if $Top.Locale='en_US' %>
                                    $Firma_en
                                <% else_if $Top.Locale='ja_JP' %>
                                    $Firma_jp
                                <% else %>
                                    $Firma
                                <% end_if %>
							</strong><br>
                            $getMyProdukt
                        </div>
					</div>
				</div>
			<% end_loop %>
		</div>
	</div>
</div>