//---------------------------------------------------------------------------------------------------//
//		Copyright (c) IPTN Ltd. All rights reserves.
//
//		File				: flipflop.v
//		Owner				: A.Mzah
//		Last modified by 	: A/Mzah
//		Organisation 		: IPTN
//		Date 				: 2021-10-19
//
//		Abstract 			: JK Flip flop signal
//
//		Description : 

module flipflop_JK(J,K,clk,rstn,Q);
	input   wire J; 			// Data input 
	input   wire K; 			// Data input 
	input   wire clk; 			// clock input 
	input   wire rstn;  		// asynchronous reset low level 
	output  reg Q;   			// output Q 
	
	reg 	Q1;
	reg 	IN_Q;
	
	assign IN_Q= (~J&~K&Q1) | (J&~K) | (J&K&~Q1) ;
	assign Q = Q1;
	
	
	
	always @(posedge clk or negedge rstn) 
	begin
		if(rstn==1'b0)
			Q1 <= 1'b0; 
		else 
			Q1 <= IN_Q; 
	end 
	
endmodule
	