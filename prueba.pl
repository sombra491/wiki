my $html=<STDIN>;

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
if($cadenaBuscadora>=1){
	$inicio=rindex($html,"[",$finalcorchete);
	$final=index($html,")",$inicioParantesis);
	$izquierda=substr($html,0,$inicio);
	$inicio=$inicio+1;
	$diferencia1=$finalcorchete-$inicio;
	$centro1=substr($html,$inicio,$diferencia1);
	$inicioParantesis=$inicioParantesis+1;
	$diferencia2=$final-$inicioParantesis;
	$centro2=substr($html,$inicioParantesis,$diferencia2);
	$final=$final+1;
	$derecho=substr($html,$final);
	$html=$izquierda.'<a href ="'.$centro2.'" >'.$centro1.'</a>'.$derecho;
}

	print "$html";	