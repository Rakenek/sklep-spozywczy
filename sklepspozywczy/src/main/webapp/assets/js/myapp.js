$(function() {
	// aktywne menu skrypt
	switch (menu) {
	case 'Strona domowa':
		$('#home').addClass('active');
		break;
	case 'O nas':
		$('#about').addClass('active');
		break;
	case 'Kontakt':
		$('#contact').addClass('active');
		break;
	default:
		$('#home').addClass('active');
	}
});