//---------------------------------------------------------------------------------------------------//
//		Copyright (c) IPTN Ltd. All rights reserves.
//
//		File				: flipflop_tb.v
//		Owner				: A.Mzah
//		Last modified by 	: A/Mzah
//		Organisation 		: IPTN
//		Date 				: 2021-10-19
//
//		Abstract 			: testbench for flipflop component
//
//		Description : 

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module flipflop_tb;

    reg D, clk, rstn ;
	wire Q;
	
    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;  

    flipflop UT_flipflop (.D(D), .clk(clk), .rstn(rstn), .Q(Q));


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
		// values for D and 
		D = 0;
		#25; // wait for period
		
		D = 1;
		#500; // wait for period
		
		D = 0;
		#50; // wait for period
		
	
		
	end
endmodule