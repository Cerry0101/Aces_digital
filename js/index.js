$('alert').hide();

$('#cpf').mask('999.999.999-99');
$('buttons').hide();
$('#titular-form').hide();
$('#profissao-form').hide();
$('#conjuge-form').hide();
$('#moradia-form').hide();
$('#profissao-conjuge-form').hide();

var valor_renda_bruta = 0;
var municipios = [];

$.ajax({
    type: 'GET',
    url: 'admin/json/municipios.json',
    success: function (result) {
        municipio = null;
        $.each(result, function (index, element) {
            if(municipio != element.municipio.nome) {
                municipios.push(element.municipio.nome);
            }
            municipio = element.municipio.nome;
        });
    }
});

function alertar(classe, msg) {
    $('buttons').toggle();
    $('.modal-footer').attr('class', `modal-footer bg-${classe} text-light`);
    $('alert').text(msg).toggle();
}
var inputCPF = $('#cpf');
var selectModalidadeId = $('#modalidade_id');

//obter modalidade
$.ajax({
    type: 'GET',
    url: 'admin/api/modalidade/obterModalidades',
    success: function (result) {
        $.each(result, function (index, element) {
            selectModalidadeId.append($('<option>', { value: element.idmodalidade, text: element.modalidade }));
        });
        selectModalidadeId.val(null);
        selectModalidadeId.selectpicker();
    }
});

function validarModalidadeCPF() {
    if (inputCPF.val().length >= 14 && selectModalidadeId.val() != null) {
        if (isValidCPF(inputCPF.val())) {
            //Mostrar dados do titular
            $('#titular-form').load('/partial/titular-form.html');
            $('#titular-form').show();
            //Mostrar dados de moradia do titular
            $('#moradia-form').load('/partial/moradia-form.html');
            $('#moradia-form').show();
            //Mostrar dados profissionais do titular
            $('#profissao-form').load('/partial/profissao-form.html');
            $('#profissao-form').show();
            //Mostrar botoes
            $('buttons').show();
        } else {
            alert('CPF inválido');
            inputCPF.val(null);

            //Esconder tudo
            $('buttons').hide();
            $('#titular-form').hide();
            $('#profissao-form').hide();
            $('#conjuge-form').hide();
            $('#moradia-form').hide();
            $('#profissao-conjuge-form').hide();
        }
    }
}

inputCPF.keyup(function () {
    validarModalidadeCPF();
});

selectModalidadeId.change(function () {
    validarModalidadeCPF();
});

$('form').submit(function () {
    var formData = $(this).serializeArray();
    if (valor_renda_bruta < 10000) {
        $.ajax({
            type: 'POST',
            url: 'admin/api/cadastro',
            data: formData,
            headers: {
                Authorization: "Bearer " + sessionStorage.token
            },
            beforeSend: function () {
                alertar('info', 'Aguarde um momento ...');
            },
            error: function (error) {
                console.log(error);
            },
            success: function (result) {
                console.log('Success: ' + result);
                $('.modal-footer').attr('class', `modal-footer bg-success text-light`);
                $('alert').text(`Cadastro efetuado com sucesso!`);
            },
            complete: function () {
                setTimeout(function () {
                    $('alert').toggle();
                    $('buttons').toggle();
                    $('.modal-footer').attr('class', 'modal-footer');
                }, 1000);
            }
        });
    } else {
        alert('Para receber a casa precisa ter renda bruta menor que R$ 10.000,00');
    }
    return false;
});