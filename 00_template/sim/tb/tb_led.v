`timescale 1ns/1ns

module tb_led();
    parameter CLK_FREQ = 100 ; parameter CLK_CYCLE = 1e9 / (CLK_FREQ * 1e6); //switch to ns
    
    reg clk;
    initial	clk                	 = 1'b0 ;      //clk is initialized to "0"
    always	# (CLK_CYCLE/2) clk   = ~clk ;       //generating a real clock by reversing
    
    
    reg     [3:0]key_in = 4'b0;  // 4位向量，初始值明确为
    wire    [3:0]led_out;    // led Outputs
    
    always @(clk) begin
        key_in = ~key_in;
    end
    
    led  u_led (
    .key (key_in),
    .led (led_out)
    );
    
    always begin
        #10;
        if ($time >= 1000) begin
            $finish ;
        end
    end
    
endmodule
