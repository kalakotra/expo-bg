<form $AttributesHTML>
	<% if $Message %>
	<p id="{$FormName}_error" class="message $MessageType">$Message</p>
	<% else %>
	<p id="{$FormName}_error" class="message $MessageType" style="display: none"></p>
	<% end_if %>
	<fieldset>
		<% if $Legend %><legend>$Legend</legend><% end_if %>
		<div class="row justify-content-between">
			<div class="col-12 col-lg-5 py-3">
				<div class="fs-3 fw-bold">
					<%t Page.ContactFormLeftTitle "Ich möchte ...." %>
				</div>
				<% loop Fields.exclude("Title", "ContactOption").exclude("Name", "Category").exclude("Type", "textarea").exclude("Type", "hidden") %>
					<div class="py-2 customFieldHolder " data-info="$Title">
						<label for="Form_ContactForm_$Title" class="form-label">$Title</label>
    					$Field
					</div>
				<% end_loop %>
			</div>
			<div class="col-12 col-lg-5 py-3">

				<div class="fs-3 fw-bold ">
					<%t Page.ContactFormRightTitle "Bitte kontaktieren Sie mich" %>
				</div>
				<div class="pt-2 pb-4">
					$Fields.dataFieldByName(ContactOption).Field
				</div>

				<% if $Fields.dataFieldByName(HideCat).value!=1 %>
					<div class="fs-3 fw-bold ">
						<%t Page.ContactFormCatFieldTitle "Kategorie" %>
					</div>

					<% with $Fields.dataFieldByName(Category) %>
						<div class="pt-2 pb-4 customFieldHolder " data-info="$Title">
							<label for="Form_ContactForm_$Title" class="form-label">$Title</label>
	    					$Field
						</div>
					<% end_with %>

				<% end_if %>
				

				<div class="fs-3 fw-bold pt-3">
					<%t Page.ContactFormNachricht "Meine Nachricht" %>
				</div>
				<div class="py-2">
					$Fields.dataFieldByName(Nachricht).Field
				</div>
			</div>
		</div>

		<div class="row py-3">
			<% loop $Actions %>
				<div class="col-auto">$Field</div>
			<% end_loop %>
		</div>
	</fieldset>
	
	$Fields.dataFieldByName(SecurityID)
</form>