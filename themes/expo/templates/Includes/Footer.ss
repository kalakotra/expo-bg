<footer >
	<!-- Textband „Fluss an Informationen" — Begriffe fliessen in Wellenbahnen
       (expo27-textflow.js). Liegt ueber den Flaechenwellen, unter dem Inhalt. -->
    <div class="text-flow" id="footer-textflow" aria-hidden="true"></div>
	<div class="container-fluid bg-primary position-relative">
		<div class="container py-3 py-lg-5">
			<div class="row ">
				<div class="col-12 col-lg-6">
					<% loop getMyClass("SocialLink") %>
						<a href="$Link" rel="noopener" class="footer-social-link me-2 mb-2">$Icon</a>
					<% end_loop %>
					<img src="$themedResourceURL('/images/footer-lines.png')" alt="Expo 2027 Footer Lines" class="mt-3" />
				</div>
				<div class="col-12 col-lg-3 pb-3 text-white">
					$SiteConfig.FooterText

					<% with $SiteConfig.ContactLink %>
						<% if $exists %>
							<a href="$URL" class="btn btn-light text-dark btn-arrow" <% if $OpenInNew %>target="_blank" rel="noopener noreferrer"<% end_if %>>$Title</a>
						<% end_if %>
					<% end_with %>
				</div>
				<div class="col-12 col-lg-3 pb-3">
					<ul class="nav footermenu">
						<% loop getMyClass.filter("ShowInFooter", "1") %>
							<li >
								<a <% if Deactivated %><% else %>href="$Link"<% end_if %> class="<% if Deactivated %>disabled<% end_if %>">$MenuTitle</a>
							</li>
						<% end_loop %>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="metafooter container-fluid">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 py-3">
					<ul class="metamenu nav">
						<li>&copy; Copyright $now.Year</li>
						<% loop getMetaMenu %>
							<li><a href="$Link">$MenuTitle</a></li>
						<% end_loop %>
					</ul>
				</div>
				<div class="col-lg-3 text-center text-lg-end py-3">
					<a class="footermetalink" href="https://www.bmaw.gv.at/" target="_blank"><img src="$themedResourceURL('/images/bmwet_logo.jpg')" alt="Bundesministerium für Arbeit und Wirtschaft" title="Bundesministerium für Arbeit und Wirtschaft" /></a>
				</div>
				<div class="col-lg-3 text-center text-lg-end py-3">
					<a class="footermetalink" href="https://www.wko.at/" target="_blank"><img src="$themedResourceURL('/images/wko-logo.png')" alt="WKO" title="WKO" /></a>
				</div>
			</div>
		</div>
	</div>
</footer>
