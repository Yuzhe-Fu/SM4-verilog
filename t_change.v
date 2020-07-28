/*******************lijingchao*********************
   ��ģ��ʵ��t�任��ʵ��Ϊ4�����е�S�б任�����32λ
   ��S�б任��
   ��������: tdata_in  32λ��
   �������: tdata_out 32λ��
***************************************************/
module t_change(//input
                tdata_in,
                //output
                tdata_out);
input    [0:31]   tdata_in;
output   [0:31]   tdata_out;

S_BOX t_sbox1(tdata_in[24:31],tdata_out[24:31]);  //S��ģ��ʵ����1��
S_BOX t_sbox2(tdata_in[16:23],tdata_out[16:23]);  //S��ģ��ʵ����2��
S_BOX t_sbox3(tdata_in[8:15],tdata_out[8:15]);    //S��ģ��ʵ����3��
S_BOX t_sbox4(tdata_in[0:7],tdata_out[0:7]);      //S��ģ��ʵ����4��

endmodule