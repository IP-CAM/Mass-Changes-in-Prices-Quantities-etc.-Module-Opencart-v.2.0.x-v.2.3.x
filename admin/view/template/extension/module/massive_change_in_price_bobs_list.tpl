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

			<form action="<?php echo $basePrice; ?>" method="post" id="form-base-price">
				<div class="well">
					<div class="row form-group">
						<div class="col-sm-8">
							<input type="text" name="base_price_factor" value="<?php echo $base_price_factor; ?>" placeholder="<?php echo $help_base_price; ?>" class="form-control" />
						</div>
						<div class="col-sm-1">
							<button name="base_price_button" form="form-base-price"  data-toggle="tooltip" title="<?php echo $help_base_price_button; ?>" class="btn btn-primary"><i class="fa fa-hand-o-up"></i></button>
						</div>
						<div class="col-sm-3">
							<span><?php echo $help_base_price; ?></span>
						</div>
					</div>
				</div>
			</form>
			<form action="<?php echo $saveAll; ?>" method="post" id="form-product">

				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
						<tr>
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
							<td class="text-right"><?php if ($sort == 'p.price') { ?>
								<a href="<?php echo $sort_price; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_price; ?></a>
								<?php } else { ?>
								<a href="<?php echo $sort_price; ?>"><?php echo $column_price; ?></a>
								<?php } ?></td>
							<td class="text-left"><?php echo $column_category; ?></td>
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
							<td class="text-center"><?php if ($product['image']) { ?>
								<img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" class="img-thumbnail" />
								<?php } else { ?>
								<span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
								<?php } ?></td>
							<td class="text-left"><?php echo $product['name']; ?></td>
							<td class="text-left"><?php echo $product['model']; ?></td>

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
									<?php echo $product['price']; ?></span></br>


								<?php if (!empty($product['special'])) { ?>
								<div class="special_price_box">
									<span><?php echo $product_special_text; ?></span>
									<div class="input-group">
										<input type="text"
											   name="product_special_id_<?php echo $product['special']['product_special_id'] ?>"
											   value="<?php echo $product['special']['price']; ?>"
											   class="form-control"/>
                          				<span class="input-group-btn">
                          					<button type="button" name="delete_special_<?php echo $product['product_id'] ?>" data-toggle="tooltip" title="<?php echo $entry_save; ?>" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>
                          				</span>
									</div>
									<span class="old_price_special" style="display: none;">
										<?php echo $old_product_special_text; ?>
									</span>
									<span class="old_price_special"
										  style="display: none;"
										  name="old_price_special_<?php echo $product['product_id'] ?>">
										<?php echo $product['special']['price']; ?>
									</span>
								</div>
								<?php } ?>


							</td>
							<td class="text-left">
								<?php foreach ($categories as $category) { ?>
								<?php if (in_array($category['category_id'], $product['category'])) { ?>
								<?php echo $category['name'];?><br>
								<?php } ?>
								<?php } ?></td>
							<td class="text-center" id="option_product_<?php echo $product['product_id'] ?>">
								<button type="button" name="options_<?php echo $product['product_id'] ?>" data-toggle="tooltip" title="<?php echo $entry_options_button; ?>" class="btn btn-primary options_button"><i class="fa fa-plus-square"></i></button>
							</td>
							<td class="text-right column_quantity"><?php if ($product['quantity'] <= 0) { ?>
								<span class="label label-warning"><?php echo $product['quantity']; ?></span>
								<?php } elseif ($product['quantity'] <= 5) { ?>
								<span class="label label-danger"><?php echo $product['quantity']; ?></span>
								<?php } else { ?>
								<span class="label label-success"><?php echo $product['quantity']; ?></span>
								<?php } ?></td>
							<td class="text-left column_status"><?php echo $product['status']; ?></td>
							<td class="text-right">
								<button type="button" name="<?php echo $product['product_id'] ?>" data-toggle="tooltip" title="<?php echo $entry_save; ?>" class="btn btn-primary save_button"><i class="fa fa-save"></i></button>
								<a href="<?php echo $product['edit']; ?>" data-toggle="tooltip" title="<?php echo $entry_edit_product; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
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
<script type="text/javascript"><!--

	//visible old prise
	$('.price_td [name ^= price_]:input').change(function(){
		$(this).siblings('.old_price').show();
	});
	//visible old prise special
	$('.price_td [name ^= product_special_id_]:input').change(function(){
		$(this).parent().siblings('.old_price_special').show();
	});


	$('.price_td [name ^= delete_special_]').click(function()
		{
			var inputSpecialPriceBox = $(this).parent().siblings(':input');
			var product_special_id=inputSpecialPriceBox.attr('name').replace('product_special_id_', '');
			alert(product_special_id);
			$.ajax({
				url: 'index.php?route=extension/module/massive_change_in_price_bobs/deleteSpecial&token=<?php echo $token; ?>&product_special_id=' + product_special_id,
				dataType: 'json',
				success: function(json) {
					alert(json);
					if(json != false) {
						inputSpecialPriceBox.attr('name', 'product_special_id_'+json['product_special_id']);
						inputSpecialPriceBox.val(json['price']);
						alert('yes');
						alert(json);
					} else {
						inputSpecialPriceBox.parent().parent().hide();
					}
				}
			});
			}
	);


	var product_id_option_open= [];
	$('.table-responsive').on('click', '.options_button', handler);
	function handler()
	{
		var product_id=$(this).attr('name').replace('options_', '');
		if (typeof product_id_option_open[product_id] != "undefined") {
			showOrHide(product_id)
		} else {
			renderOptions(product_id);
		}
		hideAndShowColumn();
	}

	function showOrHide(product_id) {
		switch(product_id_option_open[product_id]) {
			case 'show':
				$("#option_product_" + product_id + ' .options_product_sub_block').hide();
				product_id_option_open[product_id] = 'hide';
				break;
			case 'hide':
				$("#option_product_" + product_id + ' .options_product_sub_block').show();
				product_id_option_open[product_id] = 'show';
				break;
		}

	}

	function renderOptions(product_id) {
		product_id_option_open[product_id] = 'show';
		$.ajax({
			url: 'index.php?route=extension/module/massive_change_in_price_bobs/options&token=<?php echo $token; ?>&product_id=' + product_id,
			dataType: 'json',
			success: function (json) {
				var options_sub = '<div class="options_product_sub_block">';
				if(json.length)
				{
					//alert('dsfs' + json);
					for (i = 0; i < json.length; i++) {
						//alert('555');
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
						//alert(options);
					}
				} else {
					$("#option_product_" + product_id).append('<div class="text-left"><?php echo $attentions_no_options; ?></div>');
				}
				options_sub += '</div>';
				$("#option_product_" + product_id).append(options_sub);
			}
		});
	}

	function hideAndShowColumn() {
		if(product_id_option_open.indexOf('show') == -1) {

			$('.column_quantity').show();
			$('.column_status').show();
		} else {
			$('.column_quantity').hide();
			$('.column_status').hide();
		}
	}


	$('.save_button').click(function()
		{
			var product_id=$(this).attr('name');
			var price=$('[name = "price_' + product_id + '"]').val();

			var url = "";
			$("#option_product_" + product_id + " .form-control").each(function(i,elem) {
				url += '&' + $(this).attr('name') + "=" + encodeURIComponent($(this).val());
			});

			$(".price_td [name ^= product_special_id_]").each(function(i,elem) {
				url += '&' + $(this).attr('name') + "=" + encodeURIComponent($(this).val());
			});


			$.ajax({
				url: 'index.php?route=extension/module/massive_change_in_price_bobs/save&token=<?php echo $token; ?>&product_id=' + product_id + '&price=' + price,
				dataType: 'json',
				type: 'post',
				data: url,
				success: function(json) {
					//alert(price+"p"+product_id);
					$('[name = "old_price_' + product_id + '"]').text(price);
				}
			});
		}
	);
	//--></script>

<script type="text/javascript"><!--
	$('#button-filter').on('click', function() {
		var url = 'index.php?route=extension/module/massive_change_in_price_bobs&token=<?php echo $token; ?>';

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
				url: 'index.php?route=extension/module/massive_change_in_price_bobs/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
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
				url: 'index.php?route=extension/module/massive_change_in_price_bobs/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request),
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
	//--></script></div>
<?php echo $footer; ?>
