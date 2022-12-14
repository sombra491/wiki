#!"E:\Desarrollador\perl\bin\perl.exe"
use strict;
use CGI ':standard';
use DBI;
my $nombre = param('nombre');
##abrir la carpeta
my $dir = "../subwiki";
opendir DIR,$dir; 
##declarando las variables
my $prueba;
my $title;
my @dir = readdir(DIR); 
close DIR; 
##buscador del nombre del archivo
foreach(@dir){
if($_ eq ".")	{}
elsif($_ eq ".."){}
elsif($_ eq $nombre){
$prueba=&listado;
$title=$nombre;
}
else{}
}
##metodo de extracion de datos
sub listado{
	open(ARCHIVO,'<',"../subwiki/$nombre");
	while(<ARCHIVO>)               
	{        
	$prueba=$prueba.$_;                  
	}   
	close(ARCHIVO);
	return $prueba;
}
##imprimir html
print "Content-type: text/html\n\n";
print <<ENDHTML;
<html>
<head>
 	<!-- La cabecera -->
	<meta charset="utf-8"> 	
	<title>Wiki</title>
	<link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
<h1>Nuestras paginas </h1>
	<form method=GET action="./new.pl">
			<h4> $title</h4> 
			<input type=hidden name=titulo size=30 maxlength=30 value=$title style="height: 30px;">
			<input type=hidden name=edit size=30 maxlength=30 value="true" style="height: 30px;">
			<br>
			<textarea name=contenido rows="20" cols="60" >$prueba</textarea>
			<br>
			<input type=submit value="editar" style="height: 30px;">
			</form>
			<h4><a href="list.pl">Cancelar</a></h4>
</body>
</html>
ENDHTML