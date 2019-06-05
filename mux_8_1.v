module mux8_to_1(multiplier, in, out)

input [15:0] multiplier;
input [2:0] in;

output [16:0] out;

reg out [15:0];
reg [17:0] sel_0, sel_x, sel_2x;

assign sel_0 = 17'd0;
assign sel_x = {1'b1, multiplier};
assign sel_2x = {multiplier, 1'b0};

always@(in or multiplier)
begin
	case(in)
	3'b000:out = sel_0;
	3'b001:out = sel_x;
	3'b010:out = sel_x;
	3'b011:out = sel_2x;
	3'b100:out = sel_2x;
	3'b101:out = sel_x;
	3'b110:out = sel_x;
	3'b111:out = sel_0;
	endcase
end


endmodule