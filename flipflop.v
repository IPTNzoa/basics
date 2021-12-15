//---------------------------------------------------------------------------------------------------//
//		Copyright (c) IPTN Ltd. All rights reserves.
//
//		File				: flipflop.v
//		Owner				: A.Mzah
//		Last modified by 	: A/Mzah
//		Organisation 		: IPTN
//		Date 				: 2021-10-19
//
//		Abstract 			: D Flip flop signal
//
//		Description : 

module flipflop(D,clk,rstn,Q);
	input   wire D; 			// Data input 
	input   wire clk; 			// clock input 
	input   wire rstn;  		// asynchronous reset low level 
	output  reg Q;   			// output Q 
	
	always @(posedge clk or negedge rstn) 
	begin
		if(rstn==1'b0)
			Q <= 1'b0; 
		else 
			Q <= D; 
	end 
	
endmodule
	