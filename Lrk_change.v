/*******************lijingchao*********************
  ��ģ��ʵ������Կrk��L�任�������ļ��ܵ�L�任�����ƣ�
  ֻ��ѭ����λ�Ĵ�����λ����ͬ��ѭ����λ2�Σ�һ������
  13λ��һ������23λ��
  ��������: Lrkdata_in  32λ��
  �������: Lrkdata_out 32λ��
***************************************************/
module Lrk_change(//input
                    Lrkdata_in,
                    //output
                    Lrkdata_out);
input[0:31] Lrkdata_in;
output[0:31] Lrkdata_out;
  
assign Lrkdata_out=Lrkdata_in^{Lrkdata_in[13:31],Lrkdata_in[0:12]}^{Lrkdata_in[23:31],Lrkdata_in[0:22]};
                        //L�任�����㣬�������Դ��������ѭ������13λ��ѭ������23λ�����ݽ����������ĵ����ֵ��
endmodule