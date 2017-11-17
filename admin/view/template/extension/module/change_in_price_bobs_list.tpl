<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
	<div class="container-fluid">
		<div class="pull-right">
			<button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
		</div>
		<h1><?php echo $heading_title; ?></h1>
		<ul class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
		</ul>
	</div>
</div>
<div class="container-fluid">
	<?php if ($success) { ?>
	<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<?php } ?>
	<?php if ($info) { ?>
		<div class="alert alert-info">
			<p><i class="fa fa-info-circle"></i> <?php echo $info; ?></p>
		</div>
	<?php } ?>

	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
		</div>
		<div class="panel-body">
			<div class="well">
				<div class="row">
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
							<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
						</div>
						<div class="form-group">
							<label class="control-label" for="input-model"><?php echo $entry_model; ?></label>
							<input type="text" name="filter_model" value="<?php echo $filter_model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />
						</div>
						<div class="form-group">
							<label class="control-label" for="input-category"><?php echo $column_category; ?></label>
							<select name="filter_category" id="input-category" class="form-control">
								<option value="*"></option>
								<?php foreach ($categories as $category) { ?>
								<?php if ($category['product_count'] >= 1) { ?>
								<?php if ($category['category_id']==$filter_category) { ?>
								<option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?>&nbsp;&nbsp;&nbsp;&nbsp;</option>
								<?php } else { ?>
								<option value="<?php echo $category['category_id']; ?>">&nbsp;&nbsp;<?php echo $category['name']; ?>&nbsp;&nbsp;&nbsp;&nbsp;</option>
								<?php } ?>
								<?php } ?>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label" for="input-price"><?php echo $entry_price; ?></label>
							<input type="text" name="filter_price" value="<?php echo $filter_price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="form-control" />
						</div>
						<div class="form-group">
							<label class="control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
							<input type="text" name="filter_quantity" value="<?php echo $filter_quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="form-control" />
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
							<select name="filter_status" id="input-status" class="form-control">
								<option value="*"></option>
								<?php if ($filter_status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<?php } ?>
								<?php if (!$filter_status && !is_null($filter_status)) { ?>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
						<div class="form-group">
							<label class="control-label" for="input-image"><?php echo $entry_image; ?></label>
							<select name="filter_image" id="input-image" class="form-control">
								<option value="*"></option>
								<?php if ($filter_image) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<?php } ?>
								<?php if (!$filter_image && !is_null($filter_image)) { ?>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
						<button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
					</div>
				</div>
			</div>



			<form action="<?php echo $baseModifierTerminal; ?>" method="post" id="form-base-modifier-terminal">
				<!-- PRICE MODIFIER -->
				<div class="well">
					<div class="row form-group">
						<div class="col-sm-3 col-md-1 col-lg-1">
							<select name="base_price_factor_prefix" class="form-control">
								<option value="+" <?php if($base_price_factor_prefix == '+') { ?> selected="selected" <?php } ?>>+</option>
								<option value="-" <?php if($base_price_factor_prefix == '-') { ?> selected="selected" <?php } ?>>-</option>
								<option value="*" <?php if($base_price_factor_prefix == '*') { ?> selected="selected" <?php } ?>>*</option>
								<option value="=" <?php if($base_price_factor_prefix == '=') { ?> selected="selected" <?php } ?>>=</option>
							</select>
						</div>
						<div class="col-sm-3 col-md-7 col-lg-7">
							<input type="text" name="base_price_factor" value="<?php echo $base_price_factor; ?>" placeholder="<?php echo $help_base_price; ?>" class="form-control" />
						</div>
						<div class="col-sm-1 col-md-1 col-lg-1">
							<button id="base_price_button" name="base_price_button" data-toggle="tooltip" title="<?php echo $help_base_price_button; ?>" class="btn btn-primary"><i class="fa fa-hand-o-up"></i></button>
						</div>
						<div class="col-sm-5 col-md-3 col-lg-3">
							<span><?php echo $help_base_price; ?></span>
						</div>
					</div>
				</div>
				<!-- PRICE MODIFIER end -->


				<!-- QUANTITY MODIFIER -->
				<div class="well">
					<div class="row form-group">
						<div class="col-sm-3 col-md-1 col-lg-1">
							<select name="base_quantity_factor_prefix" class="form-control">
								<option value="+" <?php if($base_quantity_factor_prefix == '+') { ?> selected="selected" <?php } ?>>+</option>
								<option value="-" <?php if($base_quantity_factor_prefix == '-') { ?> selected="selected" <?php } ?>>-</option>
								<option value="*" <?php if($base_quantity_factor_prefix == '*') { ?> selected="selected" <?php } ?>>*</option>
								<option value="=" <?php if($base_quantity_factor_prefix == '=') { ?> selected="selected" <?php } ?>>=</option>
							</select>
						</div>
						<div class="col-sm-3 col-md-7 col-lg-7">
							<input type="text" name="base_quantity_factor" value="<?php echo $base_quantity_factor; ?>" placeholder="<?php echo $help_base_quantity; ?>" class="form-control" />
						</div>
						<div class="col-sm-1 col-md-1 col-lg-1">
							<button id="quantity_button" name="quantity_button" data-toggle="tooltip" title="<?php echo $help_base_quantity_button; ?>" class="btn btn-primary"><i class="fa fa-hand-o-up"></i></button>
						</div>
						<div class="col-sm-5 col-md-3 col-lg-3">
							<span><?php echo $help_base_quantity; ?></span>
						</div>
					</div>
				</div>
				<!-- QUANTITY MODIFIER end-->

				<!-- OTHER MODIFIER -->
				<div class="well">

					<div class="row form-group">
						<div class="col-sm-12 col-md-12 col-lg-12">
							<div class="col-sm-6">
								<button title="<?php echo $help_base_activate_button; ?>" name="base_activate_button" class="btn pull-left btn-success ">
									<i class="fa fa-power-off"></i> <?php echo $base_activate_button; ?>
								</button>
							</div>
							<div class="col-sm-6">
								<button title="<?php echo $help_base_deactivate_button; ?>" name="base_deactivate_button" class="btn pull-left btn-danger">
									<i class="fa fa-power-off"></i> <?php echo $base_deactivate_button; ?>
								</button>
							</div>
						</div>
					</div>

					<div class="row form-group">
						<div class="col-sm-12 col-md-12 col-lg-12">
							<div class="col-sm-6">
								<button title="<?php echo $help_base_delete_discount_button; ?>" name="base_delete_discount_button" class="btn btn-danger pull-left">
									<i class="fa fa-trash-o"></i> <?php echo $base_delete_discount_button; ?>
								</button>
							</div>
							<div class="col-sm-6">
								<button title="<?php echo $help_base_delete_sp_price_button; ?>" name="base_delete_sp_price_button" class="btn btn-danger pull-left">
									<i class="fa fa-trash-o"></i> <?php echo $base_delete_sp_price_button; ?>
								</button>
							</div>
						</div>
					</div>

				</div>
				<div class="well">
					<div class="row form-group">
						<div class="col-sm-12 col-md-12 col-lg-12">
							<div class="col-sm-6">
								<select name="base_tax" class="form-control col-sm-8">
									<?php foreach ($tax_name as $key=>$title) { ?>
									<option value="<?php echo $key ?>"><?php echo $title ?></option>
									<?php } ?>
								</select>
							</div>
							<div class="col-sm-6">
								<button title="<?php echo $help_base_tax_button; ?>" name="base_tax_button" class="btn btn-success pull-left">
									<i class="fa fa-tachometer"></i> <?php echo $base_tax_button; ?>
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- OTHER MODIFIER end-->

			</form>



			<form action="<?php echo $saveAll; ?>" method="post" id="form-product">

				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
						<tr>
							<td style="width: 1px;" class="text-center">
								<input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);">
							</td>
							<td class="text-center"><?php echo $column_image; ?></td>
							<td class="text-left"><?php if ($sort == 'pd.name') { ?>
								<a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
								<?php } else { ?>
								<a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
								<?php } ?></td>
							<td class="text-left"><?php if ($sort == 'p.model') { ?>
								<a href="<?php echo $sort_model; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_model; ?></a>
								<?php } else { ?>
								<a href="<?php echo $sort_model; ?>"><?php echo $column_model; ?></a>
								<?php } ?></td>
							<td class="text-left category"><?php echo $column_category; ?></td>
							<td class="text-right"><?php if ($sort == 'p.price') { ?>
								<a href="<?php echo $sort_price; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_price; ?></a>
								<?php } else { ?>
								<a href="<?php echo $sort_price; ?>"><?php echo $column_price; ?></a>
								<?php } ?></td>
							<td class="text-left"><?php echo $column_discount; ?></td>
							<td class="text-left"><?php echo $column_options; ?></td>
							<td class="text-right column_quantity"><?php if ($sort == 'p.quantity') { ?>
								<a href="<?php echo $sort_quantity; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_quantity; ?></a>
								<?php } else { ?>
								<a href="<?php echo $sort_quantity; ?>"><?php echo $column_quantity; ?></a>
								<?php } ?></td>
							<td class="text-left column_status"><?php if ($sort == 'p.status') { ?>
								<a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
								<?php } else { ?>
								<a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
								<?php } ?></td>
							<td class="text-right"><?php echo $column_action; ?></td>
						</tr>
						</thead>
						<tbody>
						<?php if ($products) { ?>
						<?php foreach ($products as $product) { ?>
						<tr>

							<td class="text-center">
								<input type="checkbox" name="selected_id_product[]" value="<?php echo $product['product_id'] ?>">
							</td>

							<td class="text-center"><?php if ($product['image']) { ?>
								<img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" class="img-thumbnail" />
								<?php } else { ?>
								<span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
								<?php } ?></td>


							<td class="text-left"><?php echo $product['name']; ?></td>


							<td class="text-left"><?php echo $product['model']; ?></td>


							<td class="text-left category">
								<?php foreach ($categories as $category) { ?>
								<?php if (in_array($category['category_id'], $product['category'])) { ?>
								<?php echo $category['name'];?><br>
								<?php } ?>
								<?php } ?>
							</td>


							<td class="text-left price_td">

								<input type="text"
									   name="price_<?php echo $product['product_id'] ?>"
									   value="<?php echo $product['price']; ?>"
									   placeholder="<?php echo $entry_price; ?>"
									   class="form-control"/>
								<span class="old_price" style="display: none;"><?php echo $old_product_text; ?></span>
								<span class="old_price"
									  style="display: none;"
									  name="old_price_<?php echo $product['product_id'] ?>">
									<?php echo $product['price']; ?></span>

								<?php if (!empty($product['special'])) { ?>
								<div class="special_price_box">
									<span><?php echo $product_special_text; ?></span>
									<div class="input-group">
										<input type="text"
											   name="product_special_id_<?php echo $product['special']['product_special_id'] ?>"
											   value="<?php echo $product['special']['price']; ?>"
											   class="form-control"/>
                          				<span class="input-group-btn">
                          					<button type="button" name="delete_special_<?php echo $product['product_id'] ?>" data-toggle="tooltip" title="<?php echo $entry_delete_special; ?>" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>
                          				</span>
									</div>
									<span class="old_special_price" style="display: none;">
										<?php echo $old_product_special_text; ?>
									</span>
									<span class="old_special_price"
										  style="display: none;"
										  name="old_special_price_<?php echo $product['product_id'] ?>">
										<?php echo $product['special']['price']; ?>
									</span>
								</div>
								<?php } ?>

								<span class="price_final">
									<?php echo $text_final_price; ?><?php echo $product['price_final']; ?></span>
							</td>


							<td class="text-center" name="discount_product_<?php echo $product['product_id'] ?>">
								<?php if ($product['discount_count'] == 0) { ?>
									<div class="text-left"><?php echo $attentions_no_discount; ?></div>
								<?php } else { ?>
									<button type="button" name="discount_<?php echo $product['product_id'] ?>" data-toggle="tooltip" title="<?php echo $entry_discount_button; ?>" class="btn btn-primary discount_button"><i class="fa fa-plus-square"></i></button>
								<?php } ?>
							</td>


							<td class="text-center" name="options_product_<?php echo $product['product_id'] ?>">
								<?php if ($product['options_check'] == 0) { ?>
									<div class="text-left"><?php echo $attentions_no_options; ?></div>
								<?php } elseif ($product['options_check'] == 1) { ?>
									<div class="text-left"><?php echo $attentions_no_options_price; ?></div>
								<?php } else { ?>
									<button type="button" name="options_<?php echo $product['product_id'] ?>" data-toggle="tooltip" title="<?php echo $entry_options_button; ?>" class="btn btn-primary options_button"><i class="fa fa-plus-square"></i></button>
								<?php } ?>
							</td>


							<td class="text-center column_quantity">
								<input type="text"
									   name="quantity_<?php echo $product['product_id'] ?>"
									   value="<?php echo $product['quantity']; ?>"
									   class="form-control"/>
								<span class="old_quantity" style="display: none;"><?php echo $old_quantity_text; ?></span>
								<span class="old_quantity"
									  style="display: none;"
									  name="old_quantity_<?php echo $product['product_id'] ?>">
									<?php echo $product['quantity']; ?>
								</span>
							</td>


							<td class="text-left column_status" style="width: 130px">
								<select name="status_<?php echo $product['product_id'] ?>" class="form-control">
									<?php if ($product['status']) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } ?>
								</select>
								<span class="old_status" style="display: none;"><?php echo $old_status_text; ?></span>
								<span class="old_status"
									  style="display: none;"
									  name="old_status_<?php echo $product['product_id'] ?>">
									<?php if ($product['status']) { ?>
									<?php echo $text_enabled; ?>
									<?php } else { ?>
									<?php echo $text_disabled; ?>
									<?php } ?>
								</span>
							</td>


							<td class="text-right" style="width: 120px">
								<a href="<?php echo $product['view']; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $help_views_product; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a>
								<a href="<?php echo $product['edit']; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $entry_edit_product; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>
							</td>

						</tr>
						<?php } ?>
						<?php } else { ?>
						<tr>
							<td class="text-center" colspan="10"><?php echo $text_no_results; ?></td>
						</tr>
						<?php } ?>
						</tbody>
					</table>
				</div>
			</form>
			<div class="row">
				<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
				<div class="col-sm-6 text-right"><?php echo $results; ?></div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">


	// hide/show category column
	$(window).resize(function () {
		setTimeout(resizeWindow, 300);
	});
	$(document).ready(function(){
		setTimeout(resizeWindow, 300);
	});
	$('#button-menu').on('click', function(event) {
		setTimeout(resizeWindow, 300);
	});
	function resizeWindow() {
		//alert($('.panel-body').width());
		if($('.panel-body').width()< 1230) {
			$('.category').hide();
		} else {
			$('.category').show();
		}
	}



	//visible old prise
	$('.price_td [name ^= price_]:input').change(function(){
		$(this).siblings('.old_price').show();
	});
	//visible old prise special
	$('.price_td [name ^= product_special_id_]:input').change(function(){
		$(this).parent().siblings('.old_special_price').show();
	});
	//visible old prise special
	$('[name ^= quantity_]:input').change(function(){
		$(this).siblings('.old_quantity').show();
	});
	//visible old prise special
	$('[name ^= status_]').change(function(){
		$(this).siblings('.old_status').show();
	});


	$('.price_td [name ^= delete_special_]').click(function()
		{
			if(confirm('<?php echo $text_confirm_quest ?>')) { //message
				var inputSpecialPriceBox = $(this).parent().siblings(':input');
				var product_special_id=inputSpecialPriceBox.attr('name').replace('product_special_id_', '');

				$.ajax({
					url: 'index.php?route=extension/module/change_in_price_bobs/deleteSpecial&token=<?php echo $token; ?>&product_special_id=' + product_special_id,
					dataType: 'json',
					success: function(json) {

						if(json != false) {
							inputSpecialPriceBox.attr('name', 'product_special_id_'+json['product_special_id']);
							inputSpecialPriceBox.val(json['price']);
						} else {
							inputSpecialPriceBox.parent().parent().hide();
						}
					}
				});
			}

		}
	);

	$('.table-responsive').on('click', '[name ^= delete_discount_]', deleteDiscount);
	function deleteDiscount() { //TODO
		if(confirm('<?php echo $text_confirm_quest ?>')) { //message
			var product_discount_id = $(this).attr('name').replace('delete_discount_', '');
			var button_delete = $(this);
			$.ajax({
				url: 'index.php?route=extension/module/change_in_price_bobs/deleteDiscount&token=<?php echo $token; ?>&product_discount_id=' + product_discount_id,
				dataType: 'json',
				success: function (json) {
					//alert(renderDiscountHTML(json));
					var context_tr = button_delete.parent().parent().parent().parent().parent().parent();
					$('.discount_product_sub_block', context_tr).empty();
					//context_tr.empty();
					var discount_sub = renderDiscountHTML(json);
					$('.discount_product_sub_block', context_tr).append(discount_sub);

				}
			});
		}
	}


	var product_id_discount_open= [];
	$('.table-responsive').on('click', '.discount_button', discount);
	function discount() {
		viewPostParameters(this, 'discount', product_id_discount_open)
	}


	var product_id_options_open= [];
	$('.table-responsive').on('click', '.options_button', options);
	function options() {
		viewPostParameters(this, 'options', product_id_options_open);
	}



	function viewPostParameters(this_event_call, prefix, product_id_array)
	{

		prefix = prefix + "_";
		var product_id=$(this_event_call).attr('name').replace(prefix, '');

		if (typeof product_id_array[product_id] != "undefined") {

			var DOM_element = $("[name=" + prefix + "product_" + product_id + "] ." + prefix + "product_sub_block");

			showOrHide(product_id, DOM_element, product_id_array);

		} else {
			product_id_array[product_id] = 'show';
			switch(prefix) {
				case 'discount_':
					renderDiscount(product_id);
					break;
				case 'options_':
					renderOptions(product_id);
					break;
			}
		}
		hideAndShowColumn();
	}


	function renderDiscount(product_id) {
		$.ajax({
			url: 'index.php?route=extension/module/change_in_price_bobs/discount&token=<?php echo $token; ?>&product_id=' + product_id,
			dataType: 'json',
			success: function(json){
				var discount_sub = renderDiscountHTML(json);
				$("[name=discount_product_" + product_id + "]").append(discount_sub);
			}
		});
	}

	function renderDiscountHTML(json) {
		var discount_sub = '<div class="discount_product_sub_block">';

		if(json.length)
		{
			var discount = '';
			discount +='<div class="row text-left">';
			discount +='<div class="col-sm-4">';
			discount +='<?php echo $discount_text_quantity; ?>';
			discount +='</div>';
			discount +='<div class="col-sm-8">';
			discount +='<?php echo $discount_text_price; ?>';
			discount +='</div>';
			discount +='</div>';

			discount_sub += discount;
			for (i = 0; i < json.length; i++) {

				var discount = '';
				discount +='<div class="row text-left">';
				discount +='<div class="col-sm-4">';
				discount +='<input type="text" name="product_discount_quantity_id_' + json[i]['product_discount_id'] + '" value="' + json[i]['quantity'] + '" class="form-control"/>';
				discount +='</div>';
				discount +='<div class="col-sm-8">';
				discount +='<div class="input-group">';
				discount +='<input type="text" name="product_discount_price_id_' + json[i]['product_discount_id'] + '" value="' + json[i]['price'] + '" class="form-control"/>';
				discount +='<span class="input-group-btn">';
				discount +='<button type="button" name="delete_discount_' + json[i]['product_discount_id'] + '" data-toggle="tooltip" title="<?php echo $entry_delete_discount; ?>" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>';
				discount +='</span>';
				discount +='</div>';
				discount +='</div>';
				discount +='</div>';

				discount_sub += discount;

			}
		} else {
			discount_sub += attentionsNoDiscountHTML();
		}
		discount_sub += '</div>';

		return discount_sub;

	}

	function attentionsNoDiscountHTML() {
		return '<div class="text-left"><?php echo $attentions_no_discount; ?></div>';
	}






	function renderOptions(product_id) {

		$.ajax({
			url: 'index.php?route=extension/module/change_in_price_bobs/options&token=<?php echo $token; ?>&product_id=' + product_id,
			dataType: 'json',
			success: function (json) {
				var options_sub = '<div class="options_product_sub_block">';
				if(json.length)
				{
					for (i = 0; i < json.length; i++) {

						if(json[i]['options']) {
							var options = '<div class="text-left"><strong>' + json[i]['name'] +": " + '</strong></div>';
							for (isub = 0; isub < json[i]['options'].length; isub++) {
								options +='<div class="row text-left">';
								options +='<div class="col-sm-6">';
								options +=json[i]['options'][isub]['name'] + ' ' + json[i]['options'][isub]['price_prefix'];
								options +='</div>';
								options +='<div class="col-sm-6">';
								options +='<input type="text" name="product_option_value_id_' + json[i]['options'][isub]['product_option_value_id'] + '" value="' + json[i]['options'][isub]['price'] + '" class="form-control" />'
								options +='</div>';
								options +='</div>';
							}
						} else {
							var options = '<div class="text-left"><strong>' + json[i]['name'] + "</strong>: ";
							options +='<?php echo $attentions_no_options_price; ?>';
							options +='</div>';
						}

						options_sub += options;

					}
				} else {
					options_sub += '<div class="text-left"><?php echo $attentions_no_options; ?></div>';
				}
				options_sub += '</div>';
				$("[name=options_product_" + product_id + "]").append(options_sub);
			}
		});
	}


	function showOrHide(product_id, DOM_element, product_id_array) {
		switch(product_id_array[product_id]) {
			case 'show':
				DOM_element.hide();
				product_id_array[product_id] = 'hide';
				break;
			case 'hide':
				DOM_element.show();
				product_id_array[product_id] = 'show';
				break;
		}
	}

	function hideAndShowColumn() {
		if(product_id_discount_open.indexOf('show') == -1 &&
				product_id_options_open.indexOf('show') == -1) {

			$('.column_quantity').show();
			$('.column_status').show();
		} else {
			$('.column_quantity').hide();
			$('.column_status').hide();
		}
	}



	//--></script>

<script type="text/javascript"><!--
	$('#button-filter').on('click', function() {
		var url = 'index.php?route=extension/module/change_in_price_bobs&token=<?php echo $token; ?>';

		var filter_name = $('input[name=\'filter_name\']').val();

		if (filter_name) {
			url += '&filter_name=' + encodeURIComponent(filter_name);
		}

		var filter_model = $('input[name=\'filter_model\']').val();

		if (filter_model) {
			url += '&filter_model=' + encodeURIComponent(filter_model);
		}

		var filter_price = $('input[name=\'filter_price\']').val();

		if (filter_price) {
			url += '&filter_price=' + encodeURIComponent(filter_price);
		}


		var filter_category = $('select[name=\'filter_category\']').val();

		if (filter_category != '*') {
			url += '&filter_category=' + encodeURIComponent(filter_category);
		}

		var filter_quantity = $('input[name=\'filter_quantity\']').val();

		if (filter_quantity) {
			url += '&filter_quantity=' + encodeURIComponent(filter_quantity);
		}

		var filter_status = $('select[name=\'filter_status\']').val();

		if (filter_status != '*') {
			url += '&filter_status=' + encodeURIComponent(filter_status);
		}

		var filter_image = $('select[name=\'filter_image\']').val();

		if (filter_image != '*') {
			url += '&filter_image=' + encodeURIComponent(filter_image);
		}

		location = url;
	});
	//--></script>
<script type="text/javascript"><!--
	$('input[name=\'filter_name\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=extension/module/change_in_price_bobs/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['product_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_name\']').val(item['label']);
		}
	});

	$('input[name=\'filter_model\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=extension/module/change_in_price_bobs/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['model'],
							value: item['product_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_model\']').val(item['label']);
		}
	});

	//FOR BASE CHANDE
	$('[name = \'base_price_button\'], ' +
	'[name = \'quantity_button\'], ' +
	'[name = \'base_activate_button\'], ' +
	'[name = \'base_deactivate_button\'], ' +
	'[name =\'base_delete_discount_button\'],  ' +
	'[name = \'base_delete_sp_price_button\']  ' ).click(function() {

		var arraySp =[];
		$("[name ^= selected_id_product]:checked").each(function() {
			arraySp.push($(this).val());
		});
		if(arraySp.length) {
			if(confirm('<?php echo $text_confirm_quest; ?>')) {
				var stringMas_selected_id_product = JSON.stringify(arraySp);
				$(this).append('<input type="hidden" name="selected_id_products_ar" value= ' + stringMas_selected_id_product + ' / >');
				return true;
			} else {
				return false;
			}
		} else {
			alert('<?php echo $text_warning_selected_products_zero; ?>');
			return false;
		}

	});

	$('[name = \'base_tax_button\'] ').click(function() {
		if(confirm('<?php echo $text_confirm_quest; ?>')) {
			return true;
		} else {
			return false;
		}
	});


	//--></script></div>
<?php echo $footer; ?>
