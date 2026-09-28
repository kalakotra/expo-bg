<main class="position-relative z-index-2">
	<% if TopImage %>
		<div class="container-fluid topimage" style="background-image: url($TopImage.URL);" aria-hidden="true">
			<div class="container">
				<div class="row">
					<div class="col-12 pagetitle">
						<% if PageTitle %>
							$PageTitle
						<% else %>
							<h1>$Title</h1>
						<% end_if %>
					</div>
				</div>
			</div>
		</div>
	<% else %>
			<div class="container-fluid notopimage" >
				<div class="container">
					<div class="row">
						<div class="col-12 pagetitle">
							<% if PageTitle %>
								$PageTitle
							<% else %>
								<h1>$Title</h1>
							<% end_if %>
						</div>
					</div>
				</div>
			</div>
	<% end_if %>
</main>
<section class="greybox py-3 mb-5 position-relative">
	<div class="container">
		<div class="row py-5">
			<div class="col-12 col-lg-10 py-3">
				$Content
			</div>
			<div class="col-12 col-lg-11- py-3">
                <form id="EventFilterForm">
                    <div class="row">
                        <div class="col-12 col-lg-1 fw-bold">
                            <%t EventsPage.ORT "Ort" %>
                        </div>
                        <div class="col-12 col-lg-auto">
                            <input type="checkbox" name="InPavillon" id="Filter_InPavillon" class="checkboxColor0 form-check-input">
                            <label class="right" for="Filter_InPavillon"><%t EventsPage.IMPAVILLON "im Pavillon" %></label>
                        </div>
                        <div class="col-12 col-lg-auto">
                            <input type="checkbox" name="Public" id="Filter_Public" class="checkboxColor0 form-check-input">
                            <label class="right" for="Filter_Public"><%t EventsPage.PUBLIC "öffentlich zugänglich" %></label>
                        </div>
                        <div class="w-100 py-2"></div>
                        <div class="col-12 col-lg-1 fw-bold">
                            <%t EventsPage.THEMA "Thema" %>
                        </div>
                        <div class="col-12 col-lg-auto">
                            <input type="checkbox" name="ColorReset" id="Filter_Color0" class="checkboxColor0 form-check-input" checked>
                            <label class="right" for="Filter_Color0"><%t EventsPage.COLOR0 "Alle Events" %></label>
                        </div>
                        <div class="col-12 col-lg-auto">
                            <input type="checkbox" name="Color[]" id="Filter_Color1" class="checkboxColor1 form-check-input toResetWithColor0">
                            <label class="right" for="Filter_Color1"><%t EventsPage.COLOR1 "Ihr Event" %></label>
                        </div>
                        <div class="col-12 col-lg-auto">
                            <input type="checkbox" name="Color[]" id="Filter_Color2" class="checkboxColor2 form-check-input toResetWithColor0">
                            <label class="right" for="Filter_Color2"><%t EventsPage.COLOR2 "Österreich-Tag" %></label>
                        </div>
                        <div class="col-12 col-lg-auto">
                            <input type="checkbox" name="Color[]" id="Filter_Color3" class="checkboxColor3 form-check-input toResetWithColor0">
                            <label class="right" for="Filter_Color3"><%t EventsPage.COLOR3 "Fokuswochen" %></label>
                        </div>
                        <div class="col-12 col-lg-auto">
                            <input type="checkbox" name="Color[]" id="Filter_Color4" class="checkboxColor4 form-check-input toResetWithColor0">
                            <label class="right" for="Filter_Color4"><%t EventsPage.COLOR4 "Wirtschaftsprogramm" %></label>
                        </div>
                        <div class="col-12 col-lg-auto">
                            <input type="checkbox" name="Color[]" id="Filter_Color5" class="checkboxColor5 form-check-input toResetWithColor0">
                            <label class="right" for="Filter_Color5"><%t EventsPage.COLOR5 "Kulturprogramm" %></label>
                        </div>
                    </div>
                </form>
			</div>
		</div>
	</div>
</section>
<section class="position-relative z-index-3">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div id='calendar'></div>
            </div>
        </div>
    </div>
</section>