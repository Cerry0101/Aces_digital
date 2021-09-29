//$ serve para delclarar variaveis jquery
// var declarar variaveis com js (VAR torna a variavel global)



$('#cpf').mask('999.999.999-99'); //mask = mascara 
$('buttons').hide();              //hide =esconder
$('#titular-form').hide();
$('#profissao-form').hide();
$('#conjuge-form').hide();
$('#moradia-form').hide();
$('#profissao-conjuge-form').hide();





var selectModalidadeId = $('#modalidade_id'); //Variavel selectModalidadeId = $modalidade_id


selectModalidadeId.change(function () { //O change e evento é enviado a um elemento quando seu valor muda. Este evento está limitado a <input> elementos, <textarea> caixas e <select> elementos. Para caixas de seleção, caixas de seleção e botões de rádio, o evento é disparado imediatamente quando o usuário faz uma seleção com o mouse, mas para os outros tipos de elemento, o evento é adiado até que o elemento perca o foco.
    validarModalidadeCPF(); //nome da função
});

var inputCPF = $('#cpf'); //Variavel inputCPF = $cpf

inputCPF.keyup(function () { //O evento onkeyup ocorre quando o usuário solta uma tecla (no teclado). não puxe direto da biblioteca.// metodo que puxa uma function.
    validarModalidadeCPF();
});

function validarModalidadeCPF() { //ativar a fucntion
    if (inputCPF.val().length >= 14 && selectModalidadeId.val() != null) {   //.val


        // A propriedade length de um objeto String contém o comprimento da string. length é uma propriedade read-only (somente leitura) de instâncias de string.
        //operadores relacionais.
        // >	maior que
        // >=	maior que ou igual a
        // <	menor que
        // <=	menor que ou igual a
        // ==	igual a
        // !=	diferente de




        if (isValidCPF(inputCPF.val())) {
            //Mostrar dados do titular
            $('#titular-form').load('/partial/titular-form.html');
            $('#titular-form').show();
            $('buttons').show();
        } else {
            alert('CPF inválido');
            inputCPF.val(null);

            //Esconder tudo
            $('buttons').hide();
            $('#titular-form').hide();
        }
    }
}

