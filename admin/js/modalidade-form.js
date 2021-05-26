// Load Form
$('.modal-title').text('Nova modalidade');
$('alert').hide();
$('#btn-excluir').hide();

if (data) {
    $('.modal-title').text('Modalidade #' + data.idmodalidade);
    $('input[name="idmodalidade"]').val(data.idmodalidade);
    $('input[name="modalidade"]').val(data.modalidade);
    $('input[name="edital"]').val(data.edital);
    var prazo = data.prazo;
    var newPrazo = prazo.replace(" ", "T");
    $('input[name="prazo"]').val(newPrazo);
    $('input[name="vagas"]').val(data.vagas);
    // $('#btn-excluir').show();
}

$('form').submit(function () {
    var formData = $(this).serializeArray();
    $.ajax({
        type: 'POST',
        url: 'api/modalidade',
        data: formData,
        headers: {
            Authorization: "Bearer " + sessionStorage.token
        },
        beforeSend: function () {
            alertar('info', 'Aguarde um momento ...');
        },
        statusCode: {
            200: function (result) {
                $('.modal-title').text('Modalidade #' + result);
                $('input[name="idmodalidade"]').val(result);
                $('.modal-footer').attr('class', `modal-footer bg-success text-light`);
                $('alert').text(`Modalidade Atualizada!`);
                $('#btn-excluir').show();
                datatable.ajax.reload(null, false);
            },
            201: function (result) {
                $('.modal-title').text('Modalidade #' + result);
                $('input[name="idmodalidade"]').val(result);
                $('.modal-footer').attr('class', `modal-footer bg-success text-light`);
                $('alert').text(`Modalidade criada!`);
                $('#btn-excluir').show();
                datatable.ajax.reload(null, false);
            },
            401: function (result) {
                console.log(result);
                $('.modal-footer').attr('class', `modal-footer bg-danger text-light`);
                $('alert').text(`Acesso negado!`);
            },
            400: function (result) {
                $('.modal-footer').attr('class', `modal-footer bg-danger text-light`);
                $('alert').text(`Operação não permitida!`);
            }
        },
        complete: function () {
            setTimeout(function () {
                $('alert').toggle();
                $('buttons').toggle();
                $('.modal-footer').attr('class', 'modal-footer');
            }, 1000);
        }
    });
    return false;
});

$('#btn-excluir').click(function () {
    if (confirm('Tem certeza que deseja excluir o registro?')) {
        var formData = [];
        $.ajax({
            type: 'DELETE',
            url: 'api/usuario',
            data: { name: 'idmodalidade', value: data.idmodalidade },
            headers: {
                Authorization: "Bearer " + sessionStorage.token
            },
            beforeSend: function () {
                alertar('info', 'Aguarde um momento ...');
            },
            statusCode: {
                201: function (result) {
                    $('.modal-footer').attr('class', `modal-footer bg-success text-light`);
                    $('alert').text(`Modalidade ID ${result} excluída!`);
                    datatable.ajax.reload(null, false);
                },
                401: function (result) {
                    console.log(result);
                    $('.modal-footer').attr('class', `modal-footer bg-danger text-light`);
                    $('alert').text(`Acesso negado!`);
                },
                400: function (result) {
                    $('.modal-footer').attr('class', `modal-footer bg-danger text-light`);
                    $('alert').text(`Operação não permitida!`);
                }
            },
            complete: function () {
                $('.modal').modal('hide');
            }
        });
    }
});