open(In,"pinyin.txt");
while(<In>){
	chomp;
	#��ȡ�����ƴ����Ϣ
	@Words=$_=~/(\S+)\[[^\]]*\]/g;
	@PY=$_=~/\S+\[([^\]]*)\]/g;
	#�������ݽṹ
	for( $i=0; $i<@Words; $i++ ){
			${$hash{$Words[$i]}}{$PY[$i]}++;
	}
}
close(In);

#����������
foreach (sort keys %hash){
	$refPY=$hash{$_}; 
	my @arr= keys %{$refPY};
	if(@arr > 1){
		$str="$_=>";
		foreach (sort @arr){
			$str.="[$_],${$refPY}{$_};";
		}
		print "$str\n";
	}
}
