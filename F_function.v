/*******************lijingchao*********************
   ��ģ��ʵ��F������F����ΪSM4����ϵͳ���ֺ������ܹ�
   ����32�Ρ�
   �������ݣ�Fdata_in0/1/2/3  32λ��
   ������ݣ�Fdata_out0/1/2/3 32λ��
**************************************************/
module F_function(//input
                    F_begin,F_opcode,F_clk,Fdata_in0,Fdata_in1,Fdata_in2,Fdata_in3,rk1,rk2,count_in,
                  //output
                    count_out,Fdata_out0,Fdata_out1,Fdata_out2,Fdata_out3);
input F_clk;   //F����ģ�������ʱ���źš�
input[0:5]  count_in; //�������������ź����롣
input[0:31] Fdata_in0,Fdata_in1,Fdata_in2,Fdata_in3; //F����ģ������128λ���ݣ��ָ�Ϊ4��32λ�֡�
input[0:31] rk1,rk2;  //���������Կ32λ��rk1λ����ʱ���õ�����Կ��rk2Ϊ����ʱ���õ�����Կ��


input F_opcode,F_begin; //���Ʋ����룬F_beginΪ1ʱ��ʼ���ܻ���ܣ�F_beginΪ0ʱ�������������Z��
                        //F_opcodeΪ�ӽ���ѡͨ�źţ�F_opcodeΪ1ʱ���ܣ�ѡ��rk1��F_opcodeΪ0�ǽ���ѡ��rk2��


output[0:5]  count_out; //�������������ź������
output[0:31] Fdata_out0,Fdata_out1,Fdata_out2,Fdata_out3; //�ֺ����������128λ���ݣ��ָ�Ϊ4��32λ�֡�

/////////////////////�Ĵ����ͱ�������//////////////////////////
reg[0:5] count_out; 
reg[0:31] Fdata_out0,Fdata_out1,Fdata_out2,Fdata_out3;
/////////////////////�����ͱ�������////////////////////////////
wire[0:31] int_Fvar1,int_Fvar2;  //F�������������м������ͱ�����
  
//��ѡһ����ѡ������ͨ���������Ʋ����룬ѡ����������ݣ�F_beginΪ1ʱ�����ӽ���ϵͳ��Ϊ0ʱ�������̬��F_opcodeΪ1ʱ���ü�������Կrk1��
//F_opcodeΪ0ʱ���ý�������Կrk2��
assign int_Fvar1=(F_begin==1'b1)?((F_opcode)?(Fdata_in1^Fdata_in2^Fdata_in3^rk1):(Fdata_in1^Fdata_in2^Fdata_in3^rk2)):32'bz;
//T�任��ʵ������ѡ�����������ݣ�ΪT�任�����롣
T_synchange F_T_synchange(int_Fvar1,int_Fvar2);   

//ʱ��ģ�飬��������Ч���ӽ���ϵͳ��F_begin�ź�Ϊ1ʱ������0�����(Fdata_out0)Ϊ1(Fdata_in1)�����룬1�����Ϊ2�����룬
//2�����Ϊ3�����룬3�����Ϊ0��������T�任�������int_Fvar2�����ͬʱ���ֵ����Ϊ��һ�ֵ����룬���ǹ�����ˮ�ߵĻ�
//����F_beginΪ0ʱϵͳֹͣ�����Ϊ�ߵ�ƽ��
always @(posedge  F_clk)
        if(F_begin==1'b1)
            begin
           Fdata_out0<=Fdata_in1;     
	        Fdata_out1<=Fdata_in2;     
	        Fdata_out2<=Fdata_in3;     
	        Fdata_out3<=int_Fvar2^Fdata_in0; 
	        count_out<=count_in+1;   //����������ͳ�ơ�
            end
        else
            begin
           Fdata_out0<=32'bz;     
	        Fdata_out1<=32'bz;     
	        Fdata_out2<=32'bz;     
	        Fdata_out3<=32'bz;
	        count_out<=0;
            end
             
endmodule
