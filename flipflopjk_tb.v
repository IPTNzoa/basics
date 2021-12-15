//---------------------------------------------------------------------------------------------------//
//		Copyright (c) IPTN Ltd. All rights reserves.
//
//		File				: flipflopJK_tb.v
//		Owner				: A.Mzah
//		Last modified by 	: A/Mzah
//		Organisation 		: IPTN
//		Date 				: 2021-10-19
//
//		Abstract 			: testbench for flipflopjk component
//
//		Description : 

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module flipflopjk_tb;

    reg J ;
    reg K ;
    reg clk;
    reg rstn ;
	wire Q;
	
    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;  

    flipflop_JK test_flipflopjk (J,K,clk,rstn,Q);

	// note that sensitive list is omitted in always block
	// therefore always-block run forever
	// clock period = 2 ns
	always 
	begin
		clk = 1'b1; 
		#20; // high for 20 * timescale = 20 ns
	
		clk = 1'b0;
		#20; // low for 20 * timescale = 20 ns
	end
	
	// rstn process
    always 
	begin
		rstn = 1'b0; 
		#20; // high for 20 * timescale = 20 ns
	
		rstn = 1'b1;
		#20000; // low for 20 * timescale = 20 ns
	end

	always @(posedge clk)
	begin
		// values for J and k and 
		
		J = 0;
		K = 0;
		
		
		#25;
		@(posedge clk)
		J = 1;
		K = 0;
		
		#25;
		@(posedge clk)
		J = 0;
		K = 0;	
		
		#250;
		@(posedge clk)
		J = 0;
		K = 1;
		
		
		#25; // wait for period
		@(posedge clk)
		J = 0;
		K = 0;
		
		#25;
		@(posedge clk)
		J = 1;
		K = 0;
		
		#250; // wait for period
		@(posedge clk)
		J = 0;
		K = 0;
		
		#25; // wait for period
		@(posedge clk)
		J = 1;
		K = 1;
		
		@(posedge clk)
		#250; // wait for period
	
		
		

		
	
		
	end
endmodule