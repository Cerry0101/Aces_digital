$('alert').hide();

$('form').submit(function () {

	if ($('#novasenha').val() != $('#confirmanovasenha').val()) {
		$('buttons').toggle();
		$('alert').text('A senha de confirmação é diferente da nova senha').toggle();
		setTimeout(function () {
			$('alert').toggle();
			$('buttons').toggle();
			$('input').val('');
		}, 2000);
		return false;
	}
	var formData = $(this).serializeArray();
	$.ajax({
		url: 'api/usuario/mudarSenha',
		type: 'POST',
		headers: {
			Authorization: "Bearer "+sessionStorage.token
		},
		data: formData,
		beforeSend: function () {
			$('buttons').toggle();
			$('alert').text('Aguarde um momento ...').toggle();
		},
		statusCode: {
            200: function(result){
				sessionStorage.token = result.token;
				$('alert').text('Sua senha foi alterada com sucesso');
				location.reload();
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
				// window.location.reload();
			}, 2000);
		}
	});

	return false;
});