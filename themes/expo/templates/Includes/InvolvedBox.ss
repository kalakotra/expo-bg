<% if ShowGetInvolved %>
	<div class="involvedbox">
		<div <% if GetInvolvedImage %>style="background-image: url($GetInvolvedImage.URL);"<% end_if %> >
			<div class="container py-5">
				<div class="row">
					<div class="col-7 col-lg-12 text-secondary fs-2 py-3">
						$GetInvolvedSmallTitle
					</div>
					<div class="col-7 col-lg-11 offset-lg-1 py-3">
						<div class="h1">$GetInvolvedTitle</div>
					</div>
					<% loop GetInvolvedLink.exclude('Visible','1') %>
						<div class="col-12 col-lg-8 py-3  offset-lg-1 GetInvolvedLink">
							<a href="$FormularPage.Link?v=$ID" class="fs-3"><span class="getInvolvedLinkIcon">$IconFile.Pad(65,65, FFFFFF, 100)</span> $Title <i class="fas fa-arrow-right fs-3 ps-2 text-secondary"></i></a>
						</div>
					<% end_loop %>
				</div>
			</div>
		</div>
	</div>
<% end_if %>