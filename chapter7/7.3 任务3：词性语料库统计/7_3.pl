open(In,"pos.txt");
while(<In>){
	chomp;
	#ɾ���ı���ÿ��ǰ��ĳ�����Ϣ
	if (/^\S+\s+(.*)/){
		$Sent=$1;
		#�õ�����
		@Words=$Sent=~/(\S+)\/\S+/g;
		#�õ�����
		@POSs=$Sent=~/\S+\/(\S+)/g;
		#��������ʹ��ԣ�����ֵΪ��ϣ�Ĺ�ϣ	
		for($i=0; $i<@Words; $i++){
				${$hash{$Words[$i]}}{$POSs[$i]}++;
		}
	}
}
close(In);

#��������ϣ�������ؼ���Ϊ����
foreach $word(sort keys %hash){
	print "$word=>";
	#�õ����ã�������ָ���ڲ��װ���������Ϣ�Ĺ�ϣ
	$refPos=$hash{$word};	
	foreach $pos(sort keys %{$refPos}){
		print "$pos, ${$refPos}{$pos}; ";
	}
	print "\n";
}

