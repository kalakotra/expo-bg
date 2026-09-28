<!-- ===================== HERO-VARIANTE (Wortfluss Cyber-Donau) =====================
	Lichtband aus img/cyber-donau.webp, darueber fliessen Begriffe (deutsch /
	englisch / serbisch-kyrillisch) in mehreren Bahnen und folgen dabei
	gebogen dem Verlauf der Lichtwellen — Vorbild ist die LCD-Videoprojektion
	im Pavillon. Aufbau vollstaendig aus expo27-heroflow.js; der Container
	bleibt leer und ist rein dekorativ (aria-hidden).

	Demo-Stand: nur Band + Wortanimation. Hero-Headline und die sechseckigen
	Bild-Polygone aus Hero_Join-the-Flow.png kommen spaeter additiv darueber
	(absolut positionierte Ebene in dieser Section). -->
<div class="hero-flow" id="hero-wortfluss" aria-hidden="true">
	<div class="container position-relative z-1">
		<div class="row justify-content-end">
			<% if HeroTitle %>
				<div class="col-12 col-xxl-10">
					<h1 class="hero-headline">$HeroTitle</h1>
				</div>
			<% end_if %>
			<% if HeroSubtitle %>
				<div class="col-12 col-xl-8">
					<p class="hero-subtitle">$HeroSubtitle</p>
				</div>
			<% end_if %>
		</div>
	</div>

	<div class="container hero-image-container">
		<% if HeroImage1 %>
			<div class="hero-image hero-image-1">
				$HeroImage1.FocusFill(360,350)
			</div>
		<% end_if %>
		<% if HeroImage2 %>
			<div class="hero-image hero-image-2">
				$HeroImage2.FocusFill(360,350)
			</div>
		<% end_if %>
		<% if HeroImage3 %>
			<div class="hero-image hero-image-3">
				$HeroImage3.FocusFill(260,250)
			</div>
		<% end_if %>
		<% if HeroImage4 %>
			<div class="hero-image hero-image-4">
				$HeroImage4.FocusFill(330,320)
			</div>
		<% end_if %>
		<% if HeroImage5 %>
			<div class="hero-image hero-image-5">
				$HeroImage5.FocusFill(200,195)
			</div>
		<% end_if %>
	</div>

	<% if HeroText %>
		<div class="hero-text-container">
			<div class="container">
				<div class="row ">
					<div class="col-12 col-xl-10 offset-xl-1">
						<p class="hero-text">$HeroText</p>
					</div>
				</div>
			</div>
		</div>
	<% end_if %>
	
</div>

$ElementalArea