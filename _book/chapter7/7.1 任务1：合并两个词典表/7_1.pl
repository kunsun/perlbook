ReadDict("dict1.txt");
ReadDict("dict2.txt");
Output();

#��ȡ�ʱ���Ϣ
sub ReadDict{
	my ($file)=@_;
	open(In,$file);
	while(<In>){
		chomp;
		#��ȡ��Ч����
		if(/(.*)=>(.*)/){
			$word=$1;			
			@trans=$2=~/[^@]+/g;
			#������ʵ����ݽṹ���������ݺϲ��ʹ洢
			foreach(@trans){
				${$hash{$word}}{$_}=1;
			}
		}
	}
	close(In);	
}

#����ϲ���Ĵʱ�
sub Output{
	foreach(sort keys %hash){
		print "$_=>";	
		$trans="";
		$pTrans=$hash{$_};
		foreach(sort keys %{$pTrans}){
			$trans.="$_@";
		}
		#ȥ����β�ġ�@������
		chop($trans);
		print "$trans\n";
	}
}
