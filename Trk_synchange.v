/*******************lijingchao*********************
   ��ģ��ʵ��rk��T�任�������ļ��ܵ�T�仯һ����ֻ��
   ���е�L�任��Щ��ͬ��   
   ������ݣ�Trkdata_in  32λ��
   �������ݣ�Trkdata_out 32λ��
**************************************************/
module Trk_synchange(//input
                      Trkdata_in,
                      //output
                      Trkdata_out);
input   [0:31]   Trkdata_in;
output  [0:31]   Trkdata_out;

wire[0:31] int_Trkvar;  //T�任���м������ͱ�������������t�任�������Lrk�任�����롣

	     t_change Trk_t_change(Trkdata_in,int_Trkvar);      //t�任��ʵ������
        Lrk_change Trk_Lrk_change(int_Trkvar,Trkdata_out); //Lrk�任��ʵ������

endmodule