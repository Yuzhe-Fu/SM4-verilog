/*******************lijingchao*********************
  ��ģ��ʵ��L�任���������Դ���ݣ���ѭ������2λ��10
  λ��18λ��24λ������ݽ����������õ�������ݡ�
  ��������: Ldata_in  32λ
  �������: Ldata_out 32λ
**************************************************/
module L_change(Ldata_in,Ldata_out);

input    [0:31]   Ldata_in;
output   [0:31]   Ldata_out;
	
assign   Ldata_out=Ldata_in^{Ldata_in[2:31],Ldata_in[0:1]}^{Ldata_in[10:31],Ldata_in[0:9]}^{Ldata_in[18:31],Ldata_in[0:17]}^{Ldata_in[24:31],Ldata_in[0:23]};
         //Դ������任������ݽ���������㡣
endmodule