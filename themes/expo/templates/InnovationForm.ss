<form $AttributesHTML>
	<% if $Message %>
	<p id="{$FormName}_error" class="message $MessageType">$Message</p>
	<% else %>
	<p id="{$FormName}_error" class="message $MessageType" style="display: none"></p>
	<% end_if %>
	<fieldset>
		<% if $Legend %><legend>$Legend</legend><% end_if %>
		<div class="row justify-content-between">
			<div class="col-12 col-lg-6 col-xl-5 py-3">
				<% loop Fields %>
                    <% if $Name = "VisuelleDarstellung[]" %>
                        <div class="fw-bold pt-3">
                            <%t InnovationPage.ContactFormRightTitle7 "Visuelle Darstellung" %>
                        </div>
                        <div class="small pb-2">
                            <div><%t InnovationPage.ContactFormRightTitle8 "Bitte schicken Sie max. 3 Bilder Ihrer Innovation mit Angabe des Credits" %></div>
                            <div><%t InnovationPage.ContactFormRightTitle9 "Anforderung: Imageformat: JPG or PNG, Resolution: 300 dpi, minimum size: 2000 x 1500 pixels" %></div>
                            <div><%t InnovationPage.ContactFormRightTitle10 "Datei-Benennung: Firmenname_Objektname_Nr. Dateigröße: max. 3 MB" %></div>
                        </div>
                    <% end_if %>

                    <% if $Name = "Video" %>
                        <div class="fw-bold pt-3">
                            <%t InnovationPage.ContactFormRightTitle11 "Sie haben Videos, die Ihr Produkt in max. 3 Minuten erklären?" %>
                        </div>
                        <div class="small pb-2">
                            <div><%t InnovationPage.ContactFormRightTitle12 "Bitte laden Sie das Video im Format .mp4, bestmöglich H264 oder H265 hoch, Seitenverhältnis von 16:9. Dateigröße: max. 100 MB" %></div>
                        </div>
                    <% end_if %>

                    <% if $Name = "Logo" %>
                        <div class="fw-bold pt-3">
                            <%t InnovationPage.ContactFormRightTitle13 "Logo" %>
                        </div>
                        <div class="small pb-2">
                            <div><%t InnovationPage.ContactFormRightTitle14 "Dateigröße: max. 3 MB" %></div>
                        </div>
                    <% end_if %>
					
                    $FieldHolder

					<% if $Pos=6 %>
						</div><div class="col-12 col-lg-6 col-xl-5 offset-xl-1 py-3">
					<% end_if %>
                    <% if $Pos=12 %>
						</div><div class="col-12  py-3">
                            <hr />
					<% end_if %>
				<% end_loop %>
				
			</div>
			<div class="col-12 py-3">
				<% loop $Actions %>
					$Field
				<% end_loop %>
			</div>
		</div>
	</fieldset>
	
	$Fields.dataFieldByName(SecurityID)
</form>