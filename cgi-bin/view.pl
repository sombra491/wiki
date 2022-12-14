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
	$_=&hh($_);
	$prueba=$prueba.$_;                  
	}   
	close(ARCHIVO);
	return $prueba;
}
## metodo hh
sub hh{
	my ($operacion)=@_;
	my $h6;
	my $h5;
	my $h4;
	my $h3;
	my $h2;
	my $h1;
	$h6= substr($operacion,0,6);
	$h5= substr($operacion,0,5);
	$h4= substr($operacion,0,4);
	$h3= substr($operacion,0,3);
	$h2= substr($operacion,0,2);
	$h1= substr($operacion,0,1);
	if ($h6 eq "######"){$operacion="<h6>".substr($operacion,6)."</h6>";}
	elsif($h5 eq "#####"){$operacion="<h5>".substr($operacion,5)."</h5>";}
	elsif($h4 eq "####"){$operacion="<h4>".substr($operacion,4)."</h4>";}
	elsif($h3 eq "###"){$operacion="<h3>".substr($operacion,3)."</h3>";}
	elsif($h2 eq "##"){$operacion="<h2>".substr($operacion,2)."</h2>";}
	elsif($h1 eq "#"){$operacion="<h1>".substr($operacion,1)."</h1>";}
	else {$operacion="<p>".$operacion."</p>";}
	return $operacion;	
}
##imprimir html
print "Content-type: text/html\n\n";
print <<ENDHTML;
<html>
<head>
 	<!-- La cabecera -->
	<meta charset="utf-8"> 	
	<title>$title</title>
	<link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
$prueba

<a href="../index.html">regresar al pricipio</a>
</body>
</html>
ENDHTML