$('title').text('Controle de modalidade');
$('#modalidade_id').val(null);

var datatable = $('#datatable').DataTable( {
	ajax: {
		url: 'api/modalidade',
		type: 'GET',
		deferRender: true,
		headers: {
			Authorization: "Bearer "+sessionStorage.token
		},
		dataSrc: function (json) {
			return json;
		},
	},
	columns: [
		{ data: "modalidade", className: "details-control" },
		{ data: "edital", className: "details-control" },
		{ data: "prazo", className: "details-control", render: function(dt_update) { return datetime_format(dt_update, 'd/m/y h:i') } },
		{ data: "vagas", className: "details-control" },
		{ data: "dt_update", className: "details-control", render: function(dt_update) { return datetime_format(dt_update, 'd/m/y h:i') } }
	],
	responsive: true,		
	language: {
		url: "lib/datatables/Portuguese-Brasil.lang"
	}
});

var loadForm = function () {
	$('.modal-content').load('partial/modalidade-form.html', function(response,status) {
		if ( status == 'success' ) $('.modal').modal('show');
	});
}

$('#datatable tbody').on('click', 'tr', function () {
	data = datatable.row( this ).data();
	if(data != null) loadForm();
});

$('#btn-novo').click(function() {
	data = null;
	loadForm();
});