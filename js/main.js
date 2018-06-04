
//corregir hrefs
//alert('_____');

var links = [
'http://www.revistascytconacyt.mx/index.php/revistas/area/3',
'http://www.scielo.org.mx/scielo.php?script=sci_serial&pid=1665-7063&lng=es&nrm=iso',
'http://www.redalyc.org/revista.oa?id=3587&perfil=publicacion&tipo=coleccion',
'http://bvsalud.org/es/',
'http://www.latindex.org/latindex/ficha?folio=20368',
'https://www.sciencedirect.com/journal/enfermeria-universitaria',
'https://bit.ly/2skwTwe',
'http://www.index-f.com/bibliometria/bresumen.php?id=325',
'http://www.index-f.com/reu/revista.php',
'http://www.revistas.unam.mx/index.php/reu',
]



var entry_str = $('.csl-entry').html(); 

if(entry_str != undefined){
	  
var words = entry_str.split(' ')


for (var word in words){
		var link = words[word]
		if( link.indexOf('http://')   != -1 ||  link.indexOf('https://') != -1){
     words[word] = '<a class="sidebar_link" href="'+link+'">'+link+'</a>';
	//	alert(words[word])
	}  
}

entry_str_text = words.join(" ");
entry_str = $('.csl-entry').html(entry_str_text);
//alert(entry_str_text);
//if (~str.indexOf("Yes"))
}

// 

$('.page_index_journal img').unwrap();


// mover palabras clave	

$('.block_Keywordcloud').appendTo($('.additional_content'))    //.appendTo($('.additional_content'))
	
$('.left').find('.block_Keywordcloud').hide();

//$('.current_issue').hide();

$('.block_language a').eq(1).html('Español');
$('.block_language a').eq(2).html('Português');

$('#isbn').appendTo($('.pkp_structure_head')).css({
	'font-size':'12px',
	position:'absolute',
	left:'25px',
	bottom:'35px'
})
$('#layoutdims').css('height', '35px');
//$('.block_make_submission').insertBefore('.left .obj_article_details');
$('.block_language').insertAfter('.left .block_make_submission');
//$('.pkp_search').insertBefore('.cmp_breadcrumbs')
$('.left .obj_article_details').insertBefore('.left .block_information')
//alert(foo)*



//alert(_str)

$(function(){

setTimeout(function(){
	//	$('#navigationPrimary *, .dropdown-menu *').off('mouseenter mouseleave')//.hide()

	}, 300)
})



$('.indexadores').on('click', function(){

var link = links[$(this).index()]


var win = window.open(link, '_blank');
if (win) {

    win.focus();
} else {

    alert('Por favor, cambia tu configuración para permitir el uso de ventanas emergentes');
}



})


/*
$('.galleys_links li a').off()
$('.galleys_links li a').on('click', function(){

	//alert($(this).parent().index())
	var link = $(this).attr('href')
	alert(link)
})


*/



//$('.pkp_page_article .block_language').insertBefore('.block_make_submission')


$( "#cc" ).replaceWith( '<div id="cc"> <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Licencia Creative Commons" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Enfermería Universitaria</span> por <a xmlns:cc="http://creativecommons.org/ns#" href="https://www.unam.mx/" property="cc:attributionName" rel="cc:attributionURL">Universidad Nacional Autónoma de México</a> se distribuye bajo una <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Licencia Creative Commons Atribución-NoComercial-SinDerivadas 4.0 Internacional</a>.</div>');

$('.indexadores').each(function(){


})	