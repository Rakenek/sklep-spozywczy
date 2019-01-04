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

	var products = [

	[ '1', 'ABC' ], [ '2', 'SGD' ], [ '3', 'HFD' ], [ '4', 'HEC' ],
			[ '5', 'YTI' ], [ '6', 'BDG' ], [ '7', 'KHG' ], [ '8', 'GRS' ]

	];

	var $table = $('#productListTable');

	if ($table.length) {

		$table.DataTable({
			lengthMenu:[[3,5,10,-1],['3','5','10','Wszystkie']],
			pageLength:5,
			data : products
		});
	}
}

);
