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
	$_=&ref($_);	
	$_=&sin($_);		
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
	my $status;
	my $add;
	my $commit;
	my $clone;
	my $checkout;
	my $init;
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
	elsif($h3 eq "git"){
		$status=substr($operacion,4,6);
		$add=substr($operacion,4,3);
		$clone=substr($operacion,4,5);
		$checkout=substr($operacion,4,8);
		$init=substr($operacion,4,4);
		if ($status eq "status"){$operacion="<p><code>".$operacion."</code></p>";}
		elsif($add eq "add"){$operacion="<p><code>".$operacion."</code></p>";}
		elsif($status eq "commit"){$operacion="<p><code>".$operacion."</code></p>";}
		elsif($clone eq "clone"){$operacion="<p><code>".$operacion."</code></p>";}
		elsif($checkout eq "checkout"){$operacion="<p><code>".$operacion."</code></p>";}
		elsif($init eq "init"){$operacion="<p><code>".$operacion."</code></p>";}
		elsif($init eq "push"){$operacion="<p><code>".$operacion."</code></p>";}
		else {$operacion="<p>".$operacion."</p>";}
		}
	else {$operacion="<p>".$operacion."</p>";}
	return $operacion;	
}
## metodo sin 
sub sin{
my ($html)=@_;
my $cadenaBuscadora= split("\\*\\*\\*",$html);
my $indiceInicio=index($html,"***");
my $i=0;
my $inicio;
my $final;
my $central;
my $izquierda;
my $derecha;
my $diferencia;
##3***
	if($indiceInicio>=0){
		while($i<$cadenaBuscadora){
			##separacion de datos
			$inicio=index($html,"***");
			$final=index($html,"***",($inicio+1));
			if($inicio==-1){last;}
			if($final==-1){last;}
			if($inicio==$final){last;}
			##izquierda
			$izquierda=substr($html,0,$inicio);
			$inicio=$inicio+3;
			$diferencia=$final-$inicio;
			$final=$final+3;
			##derecha
			$derecha=substr($html,$final);
			##central
			$central=substr($html,$inicio,$diferencia);
			$central="<strong><em>".$central."</em></strong>";
			$html=$izquierda.$central.$derecha;
		$i++;
		
		}
		
	}
##2**	
	$cadenaBuscadora= split("\\*\\*",$html);
	$indiceInicio=index($html,"**");
	$i=0;
	if($indiceInicio>=0){
		while($i<$cadenaBuscadora){
			##separacion de datos
			$inicio=index($html,"**");
			$final=index($html,"**",($inicio+1));
			if($inicio==-1){last;}
			if($final==-1){last;}
			if($inicio==$final){last;}
			##izquierda
			$izquierda=substr($html,0,$inicio);
			$inicio=$inicio+2;
			$diferencia=$final-$inicio;
			$final=$final+2;
			##derecha
			$derecha=substr($html,$final);
			##central
			$central=substr($html,$inicio,$diferencia);
			$central="<strong>".$central."</strong>";
			$html=$izquierda.$central.$derecha;
		$i++;
		}
		
	}	
##1*	
	$cadenaBuscadora= split("\\*",$html);
	$indiceInicio=index($html,"*");
	$i=0;
	if($indiceInicio>=0){
		while($i<$cadenaBuscadora){
			##separacion de datos
			$inicio=index($html,"*");
			$final=index($html,"*",($inicio+1));
			if($inicio==-1){last;}
			if($final==-1){last;}
			if($inicio==$final){last;}
			##izquierda
			$izquierda=substr($html,0,$inicio);
			$inicio=$inicio+1;
			$diferencia=$final-$inicio;
			$final=$final+1;
			##derecha
			$derecha=substr($html,$final);
			##central
			$central=substr($html,$inicio,$diferencia);
			$central="<em>".$central."</em>";
			$html=$izquierda.$central.$derecha;
		$i++;
		}	
	}
return $html;	
}
##metodo ref
sub ref{
my ($html)=@_;
my $cadenaBuscadora= split("\\]\\(",$html);
my $finalcorchete=index($html,"]");
my $inicioParantesis=index($html,"(");
my $i=0;
my $inicio;
my $final;
my $izquierda;
my $derecho;
my $centro1;
my $centro2;
my $diferencia1;
my $diferencia2;
if($cadenaBuscadora>1){
	$inicio=rindex($html,"[",$finalcorchete);
	$final=index($html,")",$inicioParantesis);
	if($inicio==-1){}
	elsif($final==-1){}
	else{
	$izquierda=substr($html,0,$inicio);
	$inicio=$inicio+1;
	$diferencia1=$finalcorchete-$inicio;
	$centro1=substr($html,$inicio,$diferencia1);
	$inicioParantesis=$inicioParantesis+1;
	$diferencia2=$final-$inicioParantesis;
	$centro2=substr($html,$inicioParantesis,$diferencia2);
	$final=$final+1;
	$derecho=substr($html,$final);
	$html=$izquierda.' <a href ="'.$centro2.'" >'.$centro1.'</a> '.$derecho;}
}
return $html;	
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
<a href="list.pl">regresar a la lista</a>
</body>
</html>
ENDHTML