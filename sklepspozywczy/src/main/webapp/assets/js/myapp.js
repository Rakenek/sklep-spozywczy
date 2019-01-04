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
	case 'Kontakt':
		$('#contact').addClass('active');
		break;
	default:
		$('#home').addClass('active');
		$('#a_' + menu).addClass('sidebaractive');
		break;
	}

	var $table = $('#productListTable');

	if ($table.length) {

		var jsonUrl = '';
		if (window.categoryId == '') {
			jsonUrl = window.contextRoot + '/json/data/all/products';
		} else {
			jsonUrl = window.contextRoot + '/json/data/category/'+window.categoryId+'/products';
		}

		$table.DataTable({
			lengthMenu : [ [ 3, 5, 10, -1 ], [ '3', '5', '10', 'Wszystkie' ] ],
			pageLength : 5,
			ajax:{
				url:jsonUrl,
				dataSrc:''
			},
			columns:[
				
				{
					data:'name'
					
				},
				{
					data:'brand'
					
				},
				{
					data:'unitPrice',
					mRender:function(data,type,row)
					{
						return data+' zł'
					}
					
				},
				{
					data:'unit'
					
				},
				{
					data:'quantity'
					
				},
				{
					data:'id',
					mRender:function(data,type,row){
						var str='';
						str+='<a href="'+window.contextRoot+'/show/'+data+'/product" class="btn btn-primary"><i class="icon-eye"></i></a>';
						str+='<a href="'+window.contextRoot+'/cart/add/'+data+'/product" class="btn btn-success"><i class="icon-cart-plus"></i></a>';
						
						return str;
					}
				}
				
			]
		});
	}
}

);
