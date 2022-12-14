my $html=<STDIN>;

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
$cadenaBuscadora=$cadenaBuscadora-2;
	if($indiceInicio>=2){
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
	$cadenaBuscadora=$cadenaBuscadora-2;
	if($indiceInicio>=2){
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
	print "$html";	