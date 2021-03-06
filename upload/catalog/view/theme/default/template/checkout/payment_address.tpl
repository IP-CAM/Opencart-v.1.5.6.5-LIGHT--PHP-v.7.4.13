<div class="panel-body">
	<form class="form-horizontal">
		<?php if ($addresses) { ?>
		<input type="radio" name="payment_address" value="existing" id="payment-address-existing" checked="">
		<label for="payment-address-existing"><?php echo $text_address_existing; ?></label>
		<div id="payment-existing">
			<select name="address_id" class="form-control-multiple" size="5">
				<?php foreach ($addresses as $address) { ?>
				<?php if ($address['address_id'] == $address_id) { ?>
				<option value="<?php echo $address['address_id']; ?>" selected=""><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
				<?php } ?>
				<?php } ?>
			</select>
		</div>
		<p>
			<input type="radio" name="payment_address" value="new" id="payment-address-new">
			<label for="payment-address-new"><?php echo $text_address_new; ?></label>
		</p>
		<?php } ?>
		<div id="payment-new" style="display:<?php echo $addresses ? 'none' : 'block'; ?>;">
			<hr>
			<div class="form-group">
				<label class="control-label col-sm-3" for="firstname"><b class="required">*</b> <?php echo $entry_firstname; ?></label>
				<div class="col-sm-6">
					<input type="text" name="firstname" value="" class="form-control" id="firstname">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="lastname"><b class="required">*</b> <?php echo $entry_lastname; ?></label>
				<div class="col-sm-6">
					<input type="text" name="lastname" value="" class="form-control" id="lastname">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="company"><?php echo $entry_company; ?></label>
				<div class="col-sm-6">
					<input type="text" name="company" value="" class="form-control" id="company">
				</div>
			</div>
			<?php if ($company_id_display) { ?>
			<div class="form-group">
				<label class="control-label col-sm-3" for="company_id"><?php echo $company_id_required ? '<b class="required">*</b> ' : ''; echo $entry_company_id; ?></label>
				<div class="col-sm-6">
					<input type="text" name="company_id" value="" class="form-control" id="company_id">
				</div>
			</div>
			<?php } ?>
			<?php if ($tax_id_display) { ?>
			<div class="form-group">
				<label class="control-label col-sm-3" for="tax_id"><?php echo $tax_id_required ? '<b class="required">*</b> ' : ''; echo $entry_tax_id; ?></label>
				<div class="col-sm-6">
					<input type="text" name="tax_id" value="" class="form-control" id="tax_id">
				</div>
			</div>
			<?php } ?>
			<div class="form-group">
				<label class="control-label col-sm-3" for="address_1"><b class="required">*</b> <?php echo $entry_address_1; ?></label>
				<div class="col-sm-6">
					<input type="text" name="address_1" value="" class="form-control" id="address_1">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="address_2"><?php echo $entry_address_2; ?></label>
				<div class="col-sm-6">
					<input type="text" name="address_2" value="" class="form-control" id="address_2">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="city"><b class="required">*</b> <?php echo $entry_city; ?></label>
				<div class="col-sm-6">
					<input type="text" name="city" value="" class="form-control" id="city">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="postcode"><b id="postcode-required" class="required">*</b> <?php echo $entry_postcode; ?></label>
				<div class="col-sm-6">
					<input type="text" name="postcode" value="" class="form-control" id="postcode">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="country_id"><b class="required">*</b> <?php echo $entry_country; ?></label>
				<div class="col-sm-6">
					<select name="country_id" class="form-control" id="country_id" data-param="<?php echo htmlentities('{"zone_id":"' . $zone_id . '","select":"' . $text_select . '","none":"' . $text_none . '"}'); ?>">
						<option value=""><?php echo $text_select; ?></option>
						<?php foreach ($countries as $country) { ?>
						<?php if ($country['country_id'] == $country_id) { ?>
						<option value="<?php echo $country['country_id']; ?>" selected=""><?php echo $country['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
						<?php } ?>
						<?php } ?>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="zone_id"><b class="required">*</b> <?php echo $entry_zone; ?></label>
				<div class="col-sm-6">
					<select name="zone_id" class="form-control"></select>
				</div>
			</div>
		</div>
	</form>
</div>
<div class="panel-footer text-right">
	<button type="button" id="button-payment-address" class="btn btn-primary load-left"><?php echo $button_continue; ?></button>
</div>
<script>
$(document).on('change','#payment-address input[name="payment_address"]',function(e){
	if (this.value=='new'){
		$('#payment-existing').slideUp('fast');
		$('#payment-new').slideDown(function(){
			$(this).find('#firstname').select();
			$(this).find('select[name="country_id"]').change();
		});
	} else {
		$('#payment-existing').slideDown('fast');
		$('#payment-new').slideUp('fast');
	}
});
</script>