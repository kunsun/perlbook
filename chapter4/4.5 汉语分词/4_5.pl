#�����ܣ����ո����ʱ���������ӽ�����󳤶�ƥ��ĺ���ִ�
#ʵ��˼�룺�Ѵʱ�����ϣ�����У�����¼�ʱ�������󳤶ȣ�
#��������Ӵ����ҽ�����󳤶�ƥ��ķִ�

#����ʱ��ļ�������¼�ʱ��дʵ���󳤶�
ReadDict("word.txt");
#ͨ��ѭ���û�����������ӣ����зִʴ���ֱ������'q'��'exit'�˳�����
print "Please input a sentence:(press \"exit\" or \"q\" to quit!)\n=>";
while (1){
	$Sent=<STDIN>;
	chomp($Sent);
	#��||����ʾ���򡱣�Ҳ����˵���û�����'q'��'exit'�����򶼿����˳���
	if ( $Sent eq 'exit' || $Sent eq 'q' ){	
		exit;
	}	
	
	#���÷ִʺ���Segment()��
	$Result=Segment($Sent);	
	print "$Result\n=>";	
}
sub ReadDict
{
	#�õ��������������ʱ��ļ���
	my ($Dict)=@_;	
	
	open(In,"$Dict");
	#����$MaxLen�����洢�ʱ������ʳ���
	$MaxLen=0;	
	while($Line=<In>){
		chomp($Line);
		
		#��ϣ������ֵ�洢�˴ʵĳ���
		$MapDict{$Line}=length($Line);	
		
		#��������б����г��Ȼ���Ĵʳ��ȣ��ͽ����ֵ����$MaxLen��
		#��˵�whileѭ��������ʱ��$MaxLen�������ʳ���
		if ( length($Line) > $MaxLen  ){
			$MaxLen=length($Line);
		}
	}
	close(In);

}
sub Segment
{
	my ($aSentence)=@_;	
	#$Segmented:�洢�зֽ����$Remained���洢��δ�ִʵ��ִ�
	my $Segemted="";	
	my $Remained=$aSentence; 
	
	#$Remained���ȴ���0��˵���ִ���δ�ִ����
	while ( length($Remained) > 0 ){	
		#$Match��һ����ǩ�����ã�ֵΪ1��ʾ���ڴʵ��в鵽�ôʣ�ֵΪ0��ʾû���ҵ�
		$Match=0;	
		
		#��$MaxLen��ʼ��ȡһ���ִ���Ϊ��ѡ��,��ʱ��еĴʽ���ƥ��
		for( $i=$MaxLen;$i>1;$i-- ){	
			$MatchString=substr($Remained,0,$i);	
			#�ڴʱ�������ȫƥ������ֹͣ��ƥ��
			if ( defined $MapDict{$MatchString} ){	
				$Match=1;
				last;	
			}
		}
	  
	  #��û���ڴʱ����ҵ���ƥ��Ĵ��ǿ�н�һ���ַ������ж���ǻ�ȫ�ǣ��ж�Ϊ����
		if ( $Match == 0 ){	
			#�Ե�ǰ�ַ�����ȫ�ǻ����ж���ȫ��2���ֽڣ����1���ֽ�
			if ( ord($Remained) &0x80 ){	
				$i=2;	
			}else{
				$i=1;	
			}
		}
		
		$MatchString=substr($Remained,0,$i);	
		$Segemted.=$MatchString."\/";	
		$Remained=substr($Remained,$i,length($Remained)-$i);
	}
	return $Segemted;	
}

