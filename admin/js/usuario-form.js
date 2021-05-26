// Load Form
$('.modal-title').text('Novo usuário');
$('alert').hide();
$('#btn-excluir').hide();

if (data) {
    $('.modal-title').text('Usuário #' + data.idusuario);
    $('input[name="idusuario"]').val(data.idusuario);
    $('input[name="nome"]').val(data.nome);
    $('input[name="email"]').val(data.email);
    $('input[name="orgao"]').val(data.orgao);
    $('#ativado').prop('checked', (data.ativado == 'S' ? true : false));
    $('input[name="identificador"]').val(data.identificador);

    if (data.ativado == 'S') $('#btn-excluir').hide();
    else $('#btn-excluir').show();

} else {
    data = {
        idusuario: null,
        permissao: '',
        ativado: null
    };
    $('#btn-renovar-senha').hide();
    $('#btn-excluir').hide();
}

var selectPermissao = $('select[name="permissao[]"]');
var loadPermissao = function () {
    $.each(menu.responseJSON.items, function (index, element) {
        selectPermissao.append($('<option>', { value: element.id, text: element.label }));
    });
    selectPermissao.val(data.permissao.split(','));
    selectPermissao.selectpicker();
}
loadPermissao();

$('form').submit(function () {
    var formData = $(this).serializeArray();
    $.ajax({
        type: 'POST',
        url: 'api/usuario',
        data: formData,
        headers: {
			Authorization: "Bearer "+ sessionStorage.token
		},
        beforeSend: function () {
            alertar('info', 'Aguarde um momento ...');
        },
        statusCode: {
            201: function(result){
                $('.modal-title').text('Usuário #' + result.idusuario);
                $('input[name="idusuario"]').val(result.idusuario);
                $('#btn-renovar-senha').show();

                $('.modal-footer').attr('class', `modal-footer bg-success text-light`);
                $('alert').text(`Usuário criado!`);

                if (result.ativado == 'N') $('#btn-excluir').show();
                else $('#btn-excluir').hide();

                datatable.ajax.reload(null, false);
            },
            200: function(result){
                $('.modal-title').text('Usuário #' + result.idusuario);
                $('input[name="idusuario"]').val(result.idusuario);
                $('#btn-renovar-senha').show();

                $('.modal-footer').attr('class', `modal-footer bg-success text-light`);
                $('alert').text(`Usuário atualizado!`);

                if (result.ativado == 'N') $('#btn-excluir').show();
                else $('#btn-excluir').hide();

                datatable.ajax.reload(null, false);
            },
            400: function(result){
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
        var formData = $('form').serializeArray();
        $.ajax({
            type: 'DELETE',
            url: 'api/usuario',
            data: formData,
            headers: {
                Authorization: "Bearer "+ sessionStorage.token
            },
            beforeSend: function () {
                alertar('info', 'Aguarde um momento ...');
            },
            statusCode: {
                204: function(result){
                    datatable.ajax.reload(null, false);
                },
                400: function(result){
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

$('#btn-renovar-senha').click(function () {
    var formData = [];
    formData.push({ name: 'idusuario', value: $('input[name="idusuario"]').val() });
    formData.push({ name: 'email', value: $('input[name="email"]').val() });
    $.ajax({
        type: 'POST',
        url: 'api/usuario/renovarSenha',
        data: formData,
        headers: {
			Authorization: "Bearer "+ sessionStorage.token
		},
        beforeSend: function () {
            alertar('info', 'Aguarde um momento ...');
        },
        statusCode: {
            200: function(result){
                $('.modal-footer').attr('class', `modal-footer bg-primary text-light`);
                $('alert').text('Senha do usuário ID ' + result + ' renovada!');
                datatable.ajax.reload(null, false);
            },
            401: function(result){
                console.log(result);
                $('.modal-footer').attr('class', `modal-footer bg-danger text-light`);
                $('alert').text(`Acesso negado!`);
            },
            400: function(result){
                $('.modal-footer').attr('class', `modal-footer bg-danger text-light`);
                $('alert').text(`Operação não permitida!`);
            }
        },
        complete: function () {
            setTimeout(function () {
                $('alert').toggle();
                $('buttons').toggle();
                $('.modal-footer').attr('class', 'modal-footer');
            }, 2000);
        }
    });
});

//Mascaras
$('#cartao_sus').mask('9999 9999 9999 9999');
$('#contato').mask('(99) 99999-9999');