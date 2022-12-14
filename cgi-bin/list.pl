#!"E:\Desarrollador\perl\bin\perl.exe"
use strict;
use CGI ':standard';
use DBI;

##abrir las carpetas
my $dir = "../subwiki";
opendir DIR,$dir; 
my $prueba;
my @dir = readdir(DIR); 
close DIR; 
foreach(@dir){
if($_ eq ".")	{}
elsif($_ eq ".."){}
else{	
$prueba=$prueba.'<h4>'.$_ .'
	<form method=GET action="./view.pl">
		<input type=submit value="ver"">
		<input type=hidden name=nombre value='.$_ .'>
	</form>
	<form method=GET action="./edit.pl">
		<input type=submit value="E"">
		<input type=hidden name=nombre value='.$_ .'>
	</form>
	<form method=GET action="./delete.pl">
		<input type=submit value="X">
		<input type=hidden name=nombre value='.$_ .'>
	</form>
	</h4>
<br>'; }
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
$prueba
<a href="../index.html">regresar al pricipio</a>
</body>
</html>
ENDHTML