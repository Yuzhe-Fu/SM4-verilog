/*******************lijingchao*********************
   ��ģ��ʵ��T�任��T�任��t�任��L�任���ۺϣ�����
   �������ݽ���t�任��Ȼ���ڶ�t�任��������ݽ���L��
   �����õ����յ�������ݡ�
   �������ݣ�Tdata_in  32λ��
   ������ݣ�Tdata_out 32λ��
**************************************************/
module T_synchange(//input
                    Tdata_in,
                    //output
                    Tdata_out);
input[0:31] Tdata_in;
output[0:31] Tdata_out;

wire[0:31] int_Tvar;   //�����͵��м����������t�任�������L�任�����롣

t_change T_t_change(Tdata_in,int_Tvar);  //t�任��ʵ����ģ�顣
L_change T_L_change(int_Tvar,Tdata_out); //L�任��ʵ����ģ�顣

endmodule