$(function() {
	// aktywne menu skrypt
	switch (menu) {
	case 'Strona domowa':
		$('#home').addClass('active');
		break;
	case 'Wszystkie produkty':
		$('#products').addClass('active');
		break;
	case 'O nas':
		$('#about').addClass('active');
		break;
	case 'Kontakt':
		$('#contact').addClass('active');
		break;
	case 'Zarządzenie Produktem':
		$('#manageProducts').addClass('active');
		break;
	default:
		$('#a_' + menu).addClass('sidebaractive');
		break;
	}
	// tabela skrypt
	var $table = $('#productListTable');

	if ($table.length) {

		var jsonUrl = '';
		if (window.categoryId == '') {
			jsonUrl = window.contextRoot + '/json/data/all/products';
			console.log(jsonUrl);
		} else {
			jsonUrl = window.contextRoot + '/json/data/category/'
					+ window.categoryId + '/products';
		}

		$table
				.DataTable({
					lengthMenu : [ [ 3, 5, 10, -1 ],
							[ '3', '5', '10', 'Wszystkie' ] ],
					pageLength : 5,
					ajax : {
						url : jsonUrl,
						dataSrc : ''
					},
					columns : [
							{
								data : 'code',
								bSortable:false,
								mRender : function(data, type, row) {
									return '<img src="' + window.contextRoot
											+ '/resources/images/' + data
											+ '.jpg" class="dataTableImg"/>';
								}
							},
							{
								data : 'name'

							},
							{
								data : 'brand'

							},
							{
								data : 'unitPrice',
								mRender : function(data, type, row) {
									return data + ' zł'
								}

							},
							{
								data : 'unit'

							},
							{
								data : 'quantity',
								mRender : function(data, type, row) {
									if (data < 1) {
										return '<span style="color:red">Brak w sklepie!</span>';
									}
									return data;
								}

							},
							{
								data : 'id',
								bSortable : false,
								mRender : function(data, type, row) {
									var str = '';
									str += '<a href="'
											+ window.contextRoot
											+ '/show/'
											+ data
											+ '/product" class="btn btn-primary"><i class="icon-eye"></i></a>&#160;';

									if (row.quantity < 1) {
										str += '<a href="javascript:void" class="btn btn-success disabled"><i class="icon-cart-plus"></i></a>';

									} else {
										str += '<a href="'
												+ window.contextRoot
												+ '/cart/add/'
												+ data
												+ '/product" class="btn btn-success"><i class="icon-cart-plus"></i></a>';
									}

									return str;
								}
							}

					]
				});
	}

	// usuniecie alertu po 3 sekundach
	var $alert = $('.alert');

	if ($alert.length) {
		setTimeout(function() {
			$alert.fadeOut('slow');
		}, 3000)
	}

	// bootbox

	// tabela admina
	var $adminProductsTable = $('#adminProductsTable');

	if ($adminProductsTable.length) {

		var jsonUrl = window.contextRoot+'/json/data/admin/all/products';
		console.log(jsonUrl);
		console.log(window.contextRoot);

		$adminProductsTable.DataTable({
					lengthMenu : [ [ 10, 15, 20, -1 ],
							[ '10', '15', '20', 'Wszystkie' ] ],
					pageLength : 15,
					ajax : {
						url : jsonUrl,
						dataSrc : ''
					},
					columns : [

							{
								data : 'id'
							},

							{
								data : 'code',
								bSortable:false,
								mRender : function(data, type, row) {
									return '<img src="'
											+ window.contextRoot
											+ '/resources/images/'
											+ data
											+ '.jpg" class="adminDataTableImg"/>';
								}
							},
							{
								data : 'name'

							},
							{
								data : 'brand'

							},
							{
								data : 'unitPrice',
								mRender : function(data, type, row) {
									return data + ' zł'
								}

							},
							{
								data : 'unit'

							},
							{
								data : 'quantity',
								mRender : function(data, type, row) {
									if (data < 1) {
										return '<span style="color:red">Brak w sklepie!</span>';
									}
									return data;
								}

							},
							{
								data : 'active',
								bSortable:false,
								mRender: function(data,type,row){
									
									var str='';
							str+='<label class="switch">';
							if(data){
								
								str+='<input type="checkbox" checked="checked" value="'+row.id+'" />';	
								
							}else{
								str+='<input type="checkbox" value="'+row.id+'" />';
							}	
								str+='<div class="slider"></div></label>';
							
										return str;
									
								}
								
							},
							
							{
								data:'id',
									bSortable:false,
									mRender:function(data,type,row)
									{
										var str='';
										str+='<a href="${contextRoot}/manage/'+data+'/product" class="btn btn-warning">Edytuj </a>';
										return str;
									}
							}

					],
					initComplete: function(){
						var api=this.api();
						api.$('.switch input[type="checkbox"]')
						.on(
								'change',
								function() {
									bootbox.setLocale("pl");
									var checkbox = $(this);
									var checked = checkbox.prop('checked');
									var dMsg = (checked) ? 'Czy chcesz aktywować produkt?'
											: 'Chcesz dezaktywować produkt?';
									var value = checkbox.prop('value');

									bootbox
											.confirm({
												size : 'medium',
												title : '',
												message : dMsg,
												callback : function(confirmed) {
													if (confirmed) {

														console.log(value);
														bootbox
																.alert({
																	size : 'medium',
																	title : '',
																	message : 'Wprowadzisz operacje na produkcie nr: '
																			+ value
																})

													} else {
														checkbox.prop('checked', !checked)
													}
												}
											})

								});

						
					}
				});
	}

	


	

});