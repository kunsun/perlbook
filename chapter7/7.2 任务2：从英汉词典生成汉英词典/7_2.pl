open(In, "dict.txt");
while(<In>){
	chomp;
	#��ȡ�����еĵ��ʺ�����
	if(/(.*)=>(.*)/){
		#��������浽������$enWord��
		$enWord=$1;
		#����������飨@trans��
		@trans=$2=~/[^@]+/g;
		#��ÿ����������ȡ��������
		foreach (@trans){
			$oneTrans=$_;
			#��ȡͬ�����µ������ģ�$oneTrans��
			$oneTrans=~s/^[a-z]{1,4}\. //;
			#������������飨@Words��
			@Words=$oneTrans=~/[^;]+/g;
			#����ֵΪ����Ĺ�ϣ
			foreach $cnWord(@Words){
				push(@{$hash{$cnWord}},$enWord);
			}
		}
	}
}
close(In);


#�������ֵΪ����Ĺ�ϣ
foreach(sort keys %hash){
	$str="$_=>";
	$refTrans=$hash{$_};
	foreach(sort @{$refTrans}){
		$str.="$_;";
	}
	chop($str);	
	print "$str\n";
}
