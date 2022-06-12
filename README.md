# Binary-sorter
This is a hardware descripted binary sorter as a Mealy machine with 3 states q0, q1, q2. 
It will take an 8-bit binary input stored in a parallel intern register and output it serial , sorting the values.
E.g. For the input in = 8'b01010101 the output will be 00001111;
It has a synchronising signal VO which activates as long as sorting is done (it is active for 8 clock periods)
The output is relevant as long as VO is active (8 clock periods, meaning 8x1-bit values) , otherwise the output is 0
