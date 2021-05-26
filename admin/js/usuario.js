$('title').text('Cadastro de Usuários');

var datatable = $('#datatable').DataTable( {
	ajax: {
		url: 'api/usuario',
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
		{ data: "nome", className: "details-control" },
		{ data: "email", className: "details-control" },
		{ data: "dt_update", className: "details-control", render: function(dt_update) { return datetime_format(dt_update, 'd/m/y h:i') } }
	],
	responsive: true,		
	language: {
		url: "lib/datatables/Portuguese-Brasil.lang"
	}
});

var loadForm = function () {
	$('.modal-content').load('partial/usuario-form.html', function(response,status) {
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