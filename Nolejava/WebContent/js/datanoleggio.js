$( document ).ready(function() {
	let dtToday = new Date();

	let month = dtToday.getMonth() + 1;
	let day = dtToday.getDate();
	let year = dtToday.getFullYear();
	if(month < 10)
		month = '0' + month.toString();
	if(day < 10)
		day = '0' + day.toString();
	let maxDate = year + '-' + month + '-' + day;
	$('#datainizio').attr('min', maxDate);
	$('#datafine').attr('min', maxDate);
});

$('#datainizio').change(function(){
	let maxDate = $(this).val();
	$('#datafine').attr('min', maxDate);
});