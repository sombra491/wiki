#!"E:\Desarrollador\perl\bin\perl.exe"
use strict;
use CGI ':standard';
use DBI;
my $titulo = param('titulo');
my $contenido = param('contenido');
my $edit = param('edit');
##titulo
my $tituloMD;
$tituloMD=substr($titulo,(length($titulo)-3));
if ($tituloMD eq ".md"){}
else {$titulo=$titulo.".md";}
##abrir las carpetas
my $dir = "../subwiki";
opendir DIR,$dir; 
my $prueba;
my $escritura;
my @separacion;
my @dir = readdir(DIR); 
close DIR; 
foreach(@dir){
if($_ eq ".")	{}
elsif($_ eq ".."){}
elsif($_ eq $titulo){
	if($edit eq "true"){$prueba=&escribir;}
	else {$prueba="Ya existe el nombre";}
	last;}
else{
	$prueba=&escribir;
	last;
	}
 }
##metodo de extracion de datos
sub escribir{
	@separacion = split(/\n/, $contenido);
	foreach(@separacion){
		$prueba=$prueba.$_."<br>";
		$escritura=$escritura.$_."\n";
	}
	open (ARCHIVO,'>',"../subwiki/$titulo");
	print ARCHIVO $escritura;
	close (ARCHIVO);
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
$titulo
<br>
$prueba
<br>
<a href="list.pl">regresar a la lista</a>
</body>
</html>
ENDHTML