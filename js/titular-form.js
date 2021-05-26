$('#cpf').mask('999.999.999-99');
$('#municipio').val(null);
$('#cep').mask('99999-999');
$('#contato').mask('(99) 99999-9999');
$('#sexo').val(null);
$('#estado_civil').val(null);
$('#tipo_pcd').val(null);
$('#escolaridade').val(null);
$('#div-pcd').hide();
$('#preview_foto_rg').hide();
$('#preview_foto_laudo').hide();
$('#pcd').val(null);

$('#pcd').change(function () {
    if ($('#pcd').val() == 'S') {
        $('#div-pcd').show();
        $('#tipo_pcd').attr('required', true);
        $('#cid').attr('required', true);
        $('#upload_foto_laudo').attr('required', true);
    }
    else {
        $('#div-pcd').hide();
        $('#tipo_pcd').attr('required', false);
        $('#cid').attr('required', false);
        $('#upload_foto_laudo').attr('required', false);
    }
});

var compress_foto_rg = new Compress(); //instanciando elemento do Compress;
var upload_foto_rg = document.getElementById('upload_foto_rg'); // aonde eu to pegando a imagem
var preview_foto_rg = document.getElementById('preview_foto_rg'); //aonde vai ser exibido a imagem
upload_foto_rg.addEventListener('change', (evt) => {
    var files = [...evt.target.files]
    compress_foto_rg.compress(files, {
        size: 1, // O tamanho máximo em MB, o padrão é 2 MB;
        quality: 0.75, // A qualidade da imagem, no máximo 1;
        maxWidth: 1920, // A lacompura máxima da imagem de saída, o padrão é 1920px;
        maxHeight: 1920, // A altura máxima da imagem de saída, o padrão é 1920px;
        resize: true // Padrão é verdadeiro, defina falso caso não quiser redimensionar a lacompura e altura da imagem;
    }).then((images) => {

        var img = images[0]; // criando array que vai receber as informações da imagem

        // Retorna uma imagens compactadas dentro do array;
        preview_foto_rg.src = `${img.prefix}${img.data}`;
        $('input[name="base64_rg"]').val(`${img.prefix}${img.data}`);
        $('#preview_foto_rg').show();
    })

}, false);

var compress_laudo = new Compress(); //instanciando elemento do Compress;
var upload_foto_laudo = document.getElementById('upload_foto_laudo'); // aonde eu to pegando a imagem
var preview_foto_laudo = document.getElementById('preview_foto_laudo'); //aonde vai ser exibido a imagem
upload_foto_laudo.addEventListener('change', (evt) => {
    var files = [...evt.target.files]
    compress_laudo.compress(files, {
        size: 1, // O tamanho máximo em MB, o padrão é 2 MB;
        quality: 0.75, // A qualidade da imagem, no máximo 1;
        maxWidth: 1920, // A lacompura máxima da imagem de saída, o padrão é 1920px;
        maxHeight: 1920, // A altura máxima da imagem de saída, o padrão é 1920px;
        resize: true // Padrão é verdadeiro, defina falso caso não quiser redimensionar a lacompura e altura da imagem;
    }).then((images) => {

        var img = images[0]; // criando array que vai receber as informações da imagem

        // Retorna uma imagens compactadas dentro do array;
        preview_foto_laudo.src = `${img.prefix}${img.data}`;
        $('input[name="laudo"]').val(`${img.prefix}${img.data}`);
        $('#preview_foto_laudo').show();
    })

}, false);

$('#estado_civil').change(function () {
    if ($(this).val() == 'Casado' || $(this).val() == 'União estável') {
        $('#conjuge-form').load('/partial/conjuge-form.html');
        $('#conjuge-form').show();
        $('#profissao-conjuge-form').load('/partial/profissao-conjuge-form.html');
        $('#profissao-conjuge-form').show();
    } else {
        $('#conjuge-form').html('');
        $('#conjuge-form').hide();
        $('#profissao-conjuge-form').html('');
        $('#profissao-conjuge-form').hide();
    }
});

$('select[name="sexo"]').selectpicker();
$('select[name="escolaridade"]').selectpicker();
$('select[name="estado_civil"]').selectpicker();
$('select[name="tipo_pcd"]').selectpicker();
$('select[name="pcd"]').selectpicker();