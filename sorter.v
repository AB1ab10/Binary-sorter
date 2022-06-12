`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2022 12:16:18 PM
// Design Name: 
// Module Name: sorter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sorter(
    input [7:0] in,
    input ck,
    input reset,
    input ld,
    output VO,
    output reg out
    );
    
    reg[1:0] state , next_state;
    reg[7:0] intReg;
    reg[2:0] counter;
    reg[3:0] res;
    integer i;
    
    
    
    
    parameter q0 = 2'b00 , q1 = 2'b01 ,q2 = 2'b10;
    
    always @ (posedge ck)
        if(reset)
            begin
            res = 0;
            state <= q0;
            end
            else state <= next_state;
            
   
        
      always @ (*)
        for(i = 0; i < 8; i = i + 1)
      res = res + in[i];
            
              
    
    always @ (posedge ck)
        if(reset)
            intReg <= 0;
        else if(ld == 1 && state == q1)
            intReg <= in;
            else intReg <= intReg;
    
    always @ (posedge ck)
        
            if(reset)
                counter <= 0;
                else if(state == q2)
                    counter <= counter + 1;
                    else counter <= counter;
     
    always @ (*)
        case(state)
            q0 : if(ld) next_state = q1;
                    else next_state = q0;
            q1 :  next_state = q2;
                    
            q2 : if(counter < 7) next_state = q2;
                    else next_state = q0;
            default : next_state = q0;                        
         endcase
         
         
     always @ (*) 
        if (state == q2)
            begin
            if(res > 7- counter)
                out = 1;
                else out = 0;
            end
        else out = 0;           
     
     assign VO = (state == q2) ? 1 : 0;   
                                    
                    
                
                                
    
endmodule
