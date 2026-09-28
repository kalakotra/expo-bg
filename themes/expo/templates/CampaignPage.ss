<!DOCTYPE html>

<html lang="$ContentLocale"  class="html_{$ClassName.ShortName}">
<head >
	<% base_tag %>
	<title>Awareness</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=0">
	$MetaTags(false)

	<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png?v=2.0">
	<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png?v=2.0">
	<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png?v=2.0">
	<link rel="manifest" href="/site.webmanifest">
	<link rel="mask-icon" href="/safari-pinned-tab.svg" color="#e60012">
	<meta name="msapplication-TileColor" content="#e60012">
	<meta name="theme-color" content="#e60012">

	<meta property="og:image" content="{$BaseHref}$SiteConfig.ShareImage.URL">
	<meta property="og:image:height" content="$SiteConfig.ShareImage.Height">
	<meta property="og:image:width" content="$SiteConfig.ShareImage.Width">
	<meta property="og:url" content="$BaseHref">
	<meta property="og:title" content="$SiteConfig.ShareTitle">
	<meta property="og:description" content="$SiteConfig.ShareText">
    <meta property="og:type" content="website">

</head>
<body class="$ClassName.ShortName" <% if $i18nScriptDirection %>dir="$i18nScriptDirection"<% end_if %>>
    <main class="position-relative z-index-2 container-fluid h-100">
        <div class="row justify-content-center pb-5- mainHolderRow">
            <div class="col-12 col-sm-6 col-lg-6 align-self-start order-2 order-sm-1">
                <div class="p-3 bg-white d-inline-block">$PageTitle</div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6 col-xl-3 align-self-start order-1 order-sm-2 logoHolder">
                <a href="home/?awc=logo"><img src="$themedResourceURL('/images/logo-small.jpg')" alt="Expo 2025 Logo" class="logo" /></a>
            </div>
            <div class="col-12 text-center campaignImage order-3 pt-1 align-self-center" style-x="background-image: url($TopImage.CropWidth(1900).URL)">
                <picture>
                    <source srcset="$TopImage.FocusFill(1900,800).URL" media="(min-width: 1200px)">
                    <source srcset="$TopImage.FocusFill(1200,600).URL" media="(min-width: 992px)">
                    <source srcset="$TopImage.FocusFill(992,600).URL" media="(min-width: 768px)">
                    <source srcset="$TopImage.FocusFill(768,350).URL" media="(min-width: 576px)">
                    <source srcset="$TopImage.FocusFill(576,300).URL" media="(min-width: 0px)">
                    <img src="$TopImage.URL" alt="Expo 2025 Logo" class="img-fluid" />
                </picture>
            </div>
            
        </div>
        <div class="col-12- order-4- campaignButtons">
            <div class="container">
                <div class="row">
                    <div class="col-12 order-4">
                        <div class="row justify-content-center">
                            <div class="col-12 fw-bold txt-bg-white atService">
                                <span>AUSTRIA<span class="text-secondary">@</span>SERVICE</span>
                            </div>
                            <div class="col-12 fs-1 fw-bolder text-secondary py-1 txt-bg-white dabeiSein">
                                <span>DABEI SEIN</span><br /><span>UND CHANCEN NUTZEN.</span>
                            </div>
                            <div class="col-12 col-sm-4 col-md-4 col-lg-3 col-xl-2 col-xxl-1- text-center py-1">
                                <a href="home/?awc=info" class="btn btn-secondary w-100">Information</a>
                            </div>
                            <div class="col-12 col-sm-4 col-md-4 col-lg-3 col-xl-2 col-xxl-1- text-center py-1">
                                <a href="/de/kontakt/kontaktformular-u/" class="btn btn-secondary w-100">Innovation</a>
                            </div>
                            <div class="col-12 col-sm-4 col-md-4 col-lg-3 col-xl-2 col-xxl-1- text-center py-1">
                                <a href="/de/kooperationen/" class="btn btn-secondary w-100">Kooperation</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
<script src="https://app.jurafox.de/bot/ccLoader/af55d131f6c4574385657fe101bed048/07ea87d6762212068759f8add5c4034f"></script>
</body>
</html>