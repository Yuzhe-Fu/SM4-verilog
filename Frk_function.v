/*******************lijingchao*********************
   ��ģ��ʵ��Frk������Frk����ΪSM4����ϵͳ����Կ����
   �ֺ������ܹ�����32�Ρ�
   �������ݣ�Frkdata_in0/1/2/3  32λ��
   ������ݣ�Frkdata_out 32λ��
**************************************************/
module Frk_function(Frkdata_in0,Frkdata_in1,Frkdata_in2,Frkdata_in3,ck,Frkdata_out);


input[0:31] ck,Frkdata_in0,Frkdata_in1,Frkdata_in2,Frkdata_in3;
output[0:31] Frkdata_out;

wire[31:0] int_Frkvar1,int_Frkvar2; //Frkģ����м������ͱ�����
wire[0:31] Frkdata_out; 

assign int_Frkvar1=Frkdata_in1^Frkdata_in2^Frkdata_in3^ck;    //������1��2��3��ck���õ�Trk�任�����롣
Trk_synchange Frk_Trk_synchange (int_Frkvar1,int_Frkvar2);   //����ԿTrk�任��ʵ������
assign Frkdata_out=int_Frkvar2^Frkdata_in0;                  //Trk�任��������0���������õ�����Կ�����

endmodule
