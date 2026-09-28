<header >
	<div class="container-fluid">
		<div class="row justify-content-between">
			<div class="col-5 col-lg-6">
				<a href="home/"><img src="$themedResourceURL('/images/logo-expo-27-austria-mit-belgrade.png')" alt="Expo 2027 Logo" class="logo" /></a>
			</div>
			<div class="col-7 col-lg-6 align-self-center text-right relativer">
				<div class="row justify-content-end align-items-center g-0">
					<div class="col-auto d-none d-lg-block">
						<div id="multibox" role="button" aria-pressed="false">
							<% loop $Locales %>
								<% if LinkingMode = "current" %>
									<div class="blocklang btn btn-primary glow">
									<% if $Title="Deutsch" %>
										<span class="langlink active">DE</span>
									<% else_if $Title="English" %>
										<span class="langlink active">EN</span>
									<% else %>
										<span class="langlink active">SR</span>
									<% end_if %>
										<i class="fa fa-chevron-down"></i>
									</div>
								<% end_if %>
							<% end_loop %>
							<div class="hiddenlangs" id="altlang">
								<% loop $Locales %>
									<% if LinkingMode != "current" %>
										<a href="$Link.ATT" class="btn btn-primary" <% if $LinkingMode != 'invalid' %>rel="alternate" hreflang="$Language"<% end_if %>>
											<% if $Title=English %>
												<span class="langlink">EN</span>
											<% else_if $Title=Deutsch %>
												<span class="langlink">DE</span>
											<% else %>
												<span class="langlink">SR</span>
											<% end_if %>
										</a>
									<% end_if %>
								<% end_loop %>
							</div>
						</div>
					</div>
					<div class="col-auto d-none d-lg-block shareboxHolder">
						<div class="mx-3">
							<span class="fbShare btn btn-primary glow"><img src="$themedResourceURL('/images/share.svg')" alt="share" width="18" height="18" /></span>
							<div class="sharebox">
								<a data-src="https://www.facebook.com/sharer/sharer.php?u={$BaseHref}" href="javascript:;" class="fbShare btn btn-primary" title="<%t Page.FBShare 'Seite auf Facebook teilen' %>"><img src="$themedResourceURL('/images/facebook.svg')" alt="share" width="18" height="18" /></a>
								<br />
								<a data-src="https://www.linkedin.com/sharing/share-offsite/?url={$BaseHref}" href="javascript:;" class="fbShare btn btn-primary" title="<%t Page.LinkedInShare 'Seite auf LinkedIn teilen' %>"><img src="$themedResourceURL('/images/linkedin.svg')" alt="share" width="18" height="18" /></a>
							</div>
						</div>
					</div>
					<div class="col-auto">
						<% with $SiteConfig.ContactLink %>
							<% if $exists %>
								<a href="$URL" class="btn btn-primary glow header-contact-btn" <% if $OpenInNew %>target="_blank" rel="noopener noreferrer"<% end_if %>>$Title</a>
							<% end_if %>
						<% end_with %>
					</div>
					<div class="col-auto">
						<button class="hamburger hamburger--squeeze rounded glow" type="button">
							<span class="hamburger-box">
								<span class="hamburger-inner"></span>
								<span class="d-none-special">menu</span>
							</span>
						</button>
					</div>
				</div>
				<% include Navigation %>
			</div>
		</div>
	</div>	
</header>