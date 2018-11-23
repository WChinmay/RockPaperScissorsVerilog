module LED_top_module( 
	/**************************/
	/* Set inputs and outputs */
	/* to the whole FPGA here */
	/**************************/
	input logic reset_n, //be sure to set this input to PullUp, or connect the pin to 3.3V
	input logic [2:0] p1,
	input logic [2:0] p2,
	
	output logic [2:0] state,
	output logic [6:0] segments_out
	);
		/*******************************/
		/* Set internal variables here */
		/*******************************/
		logic clk;		//used for the oscillator's 2.08 MHz clock
		logic clk_slow;	//used for slowed down, 5 Hz clock
		logic [3:0] bit0; 
		logic [3:0] bit1; 
		logic [3:0] bit2; 
		logic [3:0] bit3;
		logic [2:0] digit;
		
		
		/***********************/
		/* Define modules here */
		/***********************/
		//This is an instance of a special, built in module that accesses our chip's oscillator
		OSCH #("2.08") osc_int (	//"2.08" specifies the operating frequency, 2.08 MHz.
									//Other clock frequencies can be found in the MachX02's documentation
			.STDBY(1'b0),			//Specifies active state
			.OSC(clk),				//Outputs clock signal to 'clk' net
			.SEDSTDBY());			//Leaves SEDSTDBY pin unconnected
		
		
		//This module is instantiated from another file, 'Clock_Counter.sv'
		//It will take an input clock, slow it down based on parameters set inside of the module, and
		//output the new clock. Reset functionality is also built-in
		clock_counter counter_1(
			.clk_i(clk),
			.reset_n(reset_n),
			.clk_o(clk_slow));
			
		//This module is instantiated from another file, 'State_Machine.sv'
		//It contains a Moore state machine that will take a clock and reset, and output a state
		state_machine FSM_1(
			.clk_i(clk_slow),
			.reset_n(reset_n),
			.state(state));
			
		/************************************************/
		/* Add modules for:								*/
		/* Parser 		Determines the 1000's, 100's,   */
		/*				10's and 1's place of the number*/
		/* Multiplexer	Determines which parser output  */
		/*				to pass to the decoder			*/
		/* Decoder		Convert 4-bit binary to 7-seg   */
		/*				output for numbers 0-9			*/
		/************************************************/
					
		mux lucifer(
			.p1(p1),
			.p2(p2),
			.s(state),
			.y(digit));
		
		dec satan(
			.data(digit),
			.segments(segments_out));
			
endmodule
