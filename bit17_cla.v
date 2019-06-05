module bit17_cla (ain, bin, cin, din, sum, cout)

input [16:0] ain, bin;
input cin, din;

output [16:0] sum;
output cout;



wire cout_16;
wire b_17;
wire cin_1;


bit16_cla c1(.ain(ain[15:0]), .bin(bin[15:0]), .cin(cin), .din(din), .sum(sum[15:0]), .cout(cout_16));


// 17 bit
assign b_17 = (din == 1'b0)?(~bin[16]):(bin[16]);
assign  cin_1 = (din == 1'b0)?(1'b1):(cout_16);

assign sum[16] = (ain[16])^b_17^cin_1;
assign cout = (ain[16] & b_17) | (ain[16] & cin_1) | (b_17 & cin_1); 

endmodule