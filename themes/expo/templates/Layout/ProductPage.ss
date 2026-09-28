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
			<div class="col-12 col-lg-11 offset-lg-1 py-3 py-lg-5">
                <% loop Products %>
                    <div class="row py-3 py-lg-5">
                        <div class="col-12 col-lg-6 py-3">
                            <div class="fs-3 fw-bold">$Title</div>
                            <div class="py-3">$Text</div>
                            <% if generateWebsiteLink %>
                                <a href="$generateWebsiteLink" class="text-primary"><i class="fal fa-external-link"></i> &nbsp; <%t ProductPage.ExternalURLTitle "LINK ZUM UNTERNEHMEN" %></a>
                            <% end_if %>
                        </div>
                        <div class="col-12 col-lg-6 py-3 productImage">
                            $Image.FocusFill(870,470)
                        </div>
                    </div>
                <% end_loop %>
			</div>
			
		</div>
	</div>
</div>
