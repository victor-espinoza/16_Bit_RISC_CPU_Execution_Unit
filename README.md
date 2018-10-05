# Lab_7_CPU_Execution_Unit
Project Overview: 
CPU Execution Unit using Verilog.
  
In this project we connect the Integer Datapath (Developed in Lab_6) with two 16-bit registers (PC and IR), producing a CPU Execution Unit (CPU_EU) Verilog module. The registers are used to interface with memory. Besides the various control signals that are inputs to CPU_EU, the only outputs are the 16-bit ports (Address and D_out). The only data input is the 16-bit port D_in. The CPU_EU is then connected to the 256x16 memory (developed in Lab_4) by connecting busses between the two modules.   
  
Here is the schematic for this project:  
![ScreenShot](https://cloud.githubusercontent.com/assets/14812721/24825815/306a4058-1bdc-11e7-9eed-fc7be498edc3.jpg)

Dependencies:   
This project was created using Xilinx ISE Project Navigator Version: 14.7.  

Project Verification:  
In order to verify the correctness of our CPU_EU and Memory interface, we needed to step through the exact micro-operation sequence below. The general process for each micro-operation step is to first set up the appropriate control word using the Nexys2 board switches, and then asserting the appropriate "step clock" or memory "write enable" button.
Micro-operations:
![ScreenShot](https://cloud.githubusercontent.com/assets/14812721/24825880/83a34a16-1bdd-11e7-8d79-ad37d55d6fbe.jpg)
