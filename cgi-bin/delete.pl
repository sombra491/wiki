#!"E:\Desarrollador\perl\bin\perl.exe"
use strict;
use CGI ':standard';
use DBI;
my $nombre = param('nombre');
##abrir las carpetas
my $dir = "../subwiki";
opendir DIR,$dir; 
my $prueba;
my @dir = readdir(DIR); 
close DIR; 
foreach(@dir){
if($_ eq ".")	{}
elsif($_ eq ".."){}
elsif($_ eq $nombre){
	unlink("../subwiki/$nombre");
	$prueba=$nombre." eliminado"}
else{}
 }

##imprimir html
print "Content-type: text/html\n\n";
print <<ENDHTML;
<html>
<head>
 	<!-- La cabecera  -->
	<meta charset="utf-8"> 	
	<title>Wiki</title>
	<link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
<h1>Nuestras paginas </h1>
$prueba
<h4><a href="list.pl">Salir</a></h4>
</body>
</html>
ENDHTML