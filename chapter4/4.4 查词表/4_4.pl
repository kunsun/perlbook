#�����ܣ���ʱ�
#ʵ��˼�룺�Ѵʱ��ļ��ĵ��ʺ����ķŵ�һ����ϣ�����С���ϣ��Ա�Ĺؼ����ǵ��ʣ�ֵ�����ġ�
#��ʵ�����ж����������Ƿ�Ϊһ����ϣ��Ա�Ĺؼ��֣�����ǾͰѶ�Ӧ��ֵ�����

#����ʱ��ļ�
open(In,"dict.txt");
while($line=<In>){
	chomp($line);
	#�ʵ�Ľṹ��������=>���ġ����ԡ�=>��Ϊ��ǣ��ú���split()���ָ�ÿһ�еĴ���
	@array=split("=>",$line);	
	#����ĵ�һ����Ա�ǵ��ʣ��ڶ���Ԫ�������ģ������Ƿֱ�ֵ����ϣ����
	$word{$array[0]}=$array[1];	
}                               
close(In);

#whileѭ���������ն���û����룬ֱ���û�����'q'�˳�����
while(1)	{           
	print "Please input a word:('q' for exit)\n";	
	$input=<stdin>;	
	#ǧ��ǵ�ʹ�ú���chomp()���������ݵ�β�������Զ���һ���س���
	chomp($input);	
	
	if( $input eq "q" )	{
		print "exit!\n";
		exit;	
	}
	
	#���ҹ�ϣ�������Ƿ��й�ϣ��Ա�Ĺؼ���Ϊ����ĵ��ʣ����������Ӧ��ֵ
	if( defined $word{$input} )	{                           
		print "translation:\n$word{$input}\n";
	}else{
		print "not found!\n"
	}
}




