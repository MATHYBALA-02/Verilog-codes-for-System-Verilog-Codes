module fsm(
  input clk,
  input reset,
  input x,
  output reg state,
  output y
);
localparam [1:0]
	a=0,
	b=1,
	c=2,
	d=3,
	e=4;
reg [1:0]curstate, nxtstate;

always@(posedge clk) begin
  if(reset) begin
    curstate <= a;
  end
  else begin
    curstate <= nxtstate;
  end
end

always@(posedge clk) 
begin
  case(curstate)
	  a: begin
		  if(x) 
			  begin
				  nxtstate = c;
			  end
  		  else
  		  	  begin
			  	  nxtstate = b;
		  	  end
  end
  b: begin
	    if(x)
	    begin
		    nxtstate = d;
	    end
 	    else
	    begin	
	            nxtstate = c;
            end
    end

    c: begin
	    if(x)
	    begin 
	    	    nxtstate = c;
    	    end
    	    else
            begin 
	    	    nxtstate = e;
	    end
    end

    d:
    begin
	    if(x) 
		    begin
			    nxtstate = e; 
	            end
			    else 
				    begin
					    nxtstate = d;
				    end
    end
    e:
    begin
	    if(x) 
		    begin
			    nxtstate = d;
		    end 
            else
		    begin 
		    	     nxtstate = b;
	            end
    end
  endcase
end
assign y = (curstate == e);
endmodule
