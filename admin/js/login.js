$('alert').hide();

$('form').submit(function() {
    $.ajax({
        type: 'POST',
        url: 'api/usuario/autenticar',
        data: $(this).serializeArray(),
        beforeSend: function() {
            alertar('info', 'Aguarde um momento ...');
        },
        statusCode: {
            200: function(response){
                $('.modal-footer').attr('class', `modal-footer bg-success text-light`);
                $('alert').text(`Bem Vindo!`);
                sessionStorage.setItem('token', response.token);
                window.location.reload();
            },
            401: function(response){
                console.log(response);
                $('.modal-footer').attr('class', `modal-footer bg-danger text-light`);
                $('alert').text(`Acesso negado!`);
            },
            400: function(response){
                $('.modal-footer').attr('class', `modal-footer bg-danger text-light`);
                $('alert').text(`Operação não permitida!`);
            }
        },
        complete: function() {
            setTimeout(function() {
                $('alert').toggle();
                $('buttons').toggle();
                $('.modal-footer').attr('class', 'modal-footer');
            }, 2000);
        }
    });
    return false;
});

$('#btn-cadastrar').click(function() {
    $(".modal-content").load("partial/cadastrar-usuario.html");
});

$(".modal").on('hide.bs.modal', function() {
    window.location.reload(true);
});

$('#esqueceu-senha').click(function(){
    $(".modal-content").load("partial/esqueceu-senha.html");
});