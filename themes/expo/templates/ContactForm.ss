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
					$FieldHolder
					<% if $Pos=7 %>
						</div><div class="col-12 col-lg-6 col-xl-5 offset-xl-1 py-3">
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