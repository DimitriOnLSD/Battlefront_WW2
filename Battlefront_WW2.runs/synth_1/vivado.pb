
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/utils_1/imports/synth_1/battlefront_ww2_top.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2v
tC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/utils_1/imports/synth_1/battlefront_ww2_top.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
n
Command: %s
53*	vivadotcl2=
;synth_design -top battlefront_ww2_top -part xc7a35tcpg236-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
�The '%s' target of the following IPs are stale, please generate the output products using the generate_target or synth_ip command before running synth_design.
%s160*	vivadotcl2
	Synthesis2l
jC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
Z4-393h px� 
�
�The '%s' target of the following IPs are stale, please generate the output products using the generate_target or synth_ip command before running synth_design.
%s160*	vivadotcl2
Implementation2l
jC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
Z4-393h px� 
�
IP '%s' is locked:
%s
1260*coregen2
	clk_wiz_02�
�* IP definition 'Clocking Wizard (6.0)' for IP 'clk_wiz_0' (customized with software release 2024.1) has a different revision in the IP Catalog.Z19-2162h px�
z
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2	
xc7a35tZ17-347h px� 
j
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2	
xc7a35tZ17-349h px� 
D
Loading part %s157*device2
xc7a35tcpg236-1Z21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
11624Z8-7075h px� 
�
%s*synth2z
xStarting RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 979.418 ; gain = 469.391
h px� 
�
synthesizing module '%s'638*oasys2
battlefront_ww2_top2�
~C:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/imports/battlefront_ww2/battlefront_ww2_top.vhd2
188@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
battlefront_ww2_text2m
kC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/new/battlefront_ww2_text.vhd2
52
battlefront_ww2_text_unit2
battlefront_ww2_text2�
~C:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/imports/battlefront_ww2/battlefront_ww2_top.vhd2
1088@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
battlefront_ww2_text2o
kC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/new/battlefront_ww2_text.vhd2
168@Z8-638h px� 
�
synthesizing module '%s'638*oasys2

font_rom2w
sC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/imports/battlefront_ww2/font_rom.vhd2
208@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

font_rom2
02
12w
sC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/imports/battlefront_ww2/font_rom.vhd2
208@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
battlefront_ww2_text2
02
12o
kC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/new/battlefront_ww2_text.vhd2
168@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
battlefront_ww2_counter2p
nC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/new/battlefront_ww2_counter.vhd2
52
battlefront_ww2_counter_unit2
battlefront_ww2_counter2�
~C:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/imports/battlefront_ww2/battlefront_ww2_top.vhd2
1248@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
battlefront_ww2_counter2r
nC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/new/battlefront_ww2_counter.vhd2
148@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
battlefront_ww2_counter2
02
12r
nC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/new/battlefront_ww2_counter.vhd2
148@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	clk_wiz_02�
�C:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.runs/synth_1/.Xil/Vivado-19400-LENOVO-LOQ-15IRX9/realtime/clk_wiz_0_stub.vhdl2
62

clock_unit2
	clk_wiz_02�
~C:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/imports/battlefront_ww2/battlefront_ww2_top.vhd2
1398@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	clk_wiz_02�
�C:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.runs/synth_1/.Xil/Vivado-19400-LENOVO-LOQ-15IRX9/realtime/clk_wiz_0_stub.vhdl2
168@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

vga_sync2u
sC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/imports/battlefront_ww2/vga_sync.vhd2
52
vga_sync_unit2

vga_sync2�
~C:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/imports/battlefront_ww2/battlefront_ww2_top.vhd2
1498@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2

vga_sync2w
sC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/imports/battlefront_ww2/vga_sync.vhd2
148@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

vga_sync2
02
12w
sC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/imports/battlefront_ww2/vga_sync.vhd2
148@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
battlefront_ww22|
zC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/imports/battlefront_ww2/battlefront_ww2.vhd2
52
battlefront_ww2_unit2
battlefront_ww22�
~C:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/imports/battlefront_ww2/battlefront_ww2_top.vhd2
1638@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
battlefront_ww22~
zC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/imports/battlefront_ww2/battlefront_ww2.vhd2
218@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
battlefront_ww22
02
12~
zC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/imports/battlefront_ww2/battlefront_ww2.vhd2
218@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
battlefront_ww2_top2
02
12�
~C:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/imports/battlefront_ww2/battlefront_ww2_top.vhd2
188@Z8-256h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
game_over_txt_on2
battlefront_ww2_text2o
kC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/new/battlefront_ww2_text.vhd2
268@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
led2
battlefront_ww22~
zC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/imports/battlefront_ww2/battlefront_ww2.vhd2
138@Z8-3848h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2	
led[15]2
battlefront_ww2Z8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2	
led[14]2
battlefront_ww2Z8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2	
led[13]2
battlefront_ww2Z8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2	
led[12]2
battlefront_ww2Z8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2	
led[11]2
battlefront_ww2Z8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2	
led[10]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[9]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[8]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[7]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[6]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[5]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[4]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[3]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[2]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[1]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[0]2
battlefront_ww2Z8-7129h px� 
{
9Port %s in module %s is either unconnected or has no load4866*oasys2
	gra_still2
battlefront_ww2Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

text_on[3]2
battlefront_ww2_textZ8-7129h px� 
|
9Port %s in module %s is either unconnected or has no load4866*oasys2
reset2
battlefront_ww2_textZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

pixel_y[0]2
battlefront_ww2_textZ8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 1106.809 ; gain = 596.781
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 1106.809 ; gain = 596.781
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 1106.809 ; gain = 596.781
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0092

1106.8092
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
}c:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.gen/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc2

clock_unit	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
}c:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.gen/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc2

clock_unit	8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2|
xC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/constrs_1/imports/battlefront_ww2/basys3_master.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2|
xC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/constrs_1/imports/battlefront_ww2/basys3_master.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2z
xC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/constrs_1/imports/battlefront_ww2/basys3_master.xdc2'
%.Xil/battlefront_ww2_top_propImpl.xdcZ1-236h px� 
�
Parsing XDC File [%s]
179*designutils2_
[C:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.runs/synth_1/dont_touch.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2_
[C:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.runs/synth_1/dont_touch.xdc8Z20-178h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1201.0742
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0042

1201.0742
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:10 ; elapsed = 00:00:11 . Memory (MB): peak = 1201.074 ; gain = 691.047
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7a35tcpg236-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:10 ; elapsed = 00:00:11 . Memory (MB): peak = 1201.074 ; gain = 691.047
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:10 ; elapsed = 00:00:11 . Memory (MB): peak = 1201.074 ; gain = 691.047
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
{
3inferred FSM for state register '%s' in module '%s'802*oasys2
state_reg_reg2
battlefront_ww2_topZ8-802h px� 
�
!inferring latch for variable '%s'327*oasys2
char_addr_reg2o
kC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/new/battlefront_ww2_text.vhd2
1208@Z8-327h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                   rules |                               00 |                               00
h p
x
� 
y
%s
*synth2a
_                 newgame |                               01 |                               01
h p
x
� 
y
%s
*synth2a
_                    play |                               10 |                               10
h p
x
� 
y
%s
*synth2a
_                    over |                               11 |                               11
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
state_reg_reg2

sequential2
battlefront_ww2_topZ8-3354h px� 
�
!inferring latch for variable '%s'327*oasys2
	d_clr_reg2�
~C:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.srcs/sources_1/imports/battlefront_ww2/battlefront_ww2_top.vhd2
1308@Z8-327h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:11 ; elapsed = 00:00:12 . Memory (MB): peak = 1201.074 ; gain = 691.047
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   3 Input   33 Bit       Adders := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input   11 Bit       Adders := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input   10 Bit       Adders := 19    
h p
x
� 
F
%s
*synth2.
,	   3 Input    5 Bit       Adders := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit       Adders := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit       Adders := 4     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               12 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               11 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               10 Bit    Registers := 10    
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 4     
h p
x
� 
H
%s
*synth20
.	                2 Bit    Registers := 4     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 3     
h p
x
� 
&
%s
*synth2
+---ROMs : 
h p
x
� 
>
%s
*synth2&
$	                    ROMs := 1     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   12 Bit        Muxes := 14    
h p
x
� 
F
%s
*synth2.
,	  16 Input   12 Bit        Muxes := 8     
h p
x
� 
F
%s
*synth2.
,	  32 Input   12 Bit        Muxes := 19    
h p
x
� 
F
%s
*synth2.
,	   2 Input   10 Bit        Muxes := 8     
h p
x
� 
F
%s
*synth2.
,	   2 Input    7 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 8     
h p
x
� 
F
%s
*synth2.
,	  32 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    2 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 21    
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 7     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
p
%s
*synth2X
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2	
led[15]2
battlefront_ww2Z8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2	
led[14]2
battlefront_ww2Z8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2	
led[13]2
battlefront_ww2Z8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2	
led[12]2
battlefront_ww2Z8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2	
led[11]2
battlefront_ww2Z8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2	
led[10]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[9]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[8]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[7]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[6]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[5]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[4]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[3]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[2]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[1]2
battlefront_ww2Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[0]2
battlefront_ww2Z8-7129h px� 
{
9Port %s in module %s is either unconnected or has no load4866*oasys2
	gra_still2
battlefront_ww2Z8-7129h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
	d_clr_reg2
battlefront_ww2_topZ8-3332h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:23 ; elapsed = 00:00:24 . Memory (MB): peak = 1275.285 ; gain = 765.258
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
;
%s*synth2#
!
ROM: Preliminary Mapping Report
h px� 
�
%s*synth2m
k+--------------------+--------------------------------------------------+---------------+----------------+
h px� 
�
%s*synth2n
l|Module Name         | RTL Object                                       | Depth x Width | Implemented As | 
h px� 
�
%s*synth2m
k+--------------------+--------------------------------------------------+---------------+----------------+
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,12]                    | 32x1          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,13]                    | 32x1          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,14]                    | 32x5          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,15]                    | 32x8          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,19]                    | 32x9          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,20]                    | 32x9          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,21]                    | 32x9          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,22]                    | 32x5          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,23]                    | 32x5          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,24]                    | 32x6          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,26]                    | 32x7          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,27]                    | 32x8          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,28]                    | 32x6          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,29]                    | 32x6          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,30]                    | 32x4          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,3]                   | 32x5          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,4]                   | 32x5          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,5]                   | 32x9          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,6]                   | 32x9          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,7]                   | 32x12         | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,10]                  | 32x10         | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,16]                  | 32x5          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,17]                  | 32x5          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,18]                  | 32x3          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,19]                  | 32x3          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,21]                  | 32x1          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,12]                    | 32x1          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,13]                    | 32x1          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,14]                    | 32x5          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,15]                    | 32x8          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,19]                    | 32x9          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,20]                    | 32x9          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,21]                    | 32x9          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,22]                    | 32x5          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,23]                    | 32x5          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,24]                    | 32x6          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,26]                    | 32x7          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,27]                    | 32x8          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,28]                    | 32x6          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,29]                    | 32x6          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | GERMAN_SOLDIER_IDLE_ROM[0,30]                    | 32x4          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,3]                   | 32x5          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,4]                   | 32x5          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,5]                   | 32x9          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,6]                   | 32x9          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,7]                   | 32x12         | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,10]                  | 32x10         | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,16]                  | 32x5          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,17]                  | 32x5          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,18]                  | 32x3          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,19]                  | 32x3          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2     | AMERICAN_SOLDIER_IDLE_ROM[0,21]                  | 32x1          | LUT            | 
h px� 
�
%s*synth2n
l|battlefront_ww2_top | battlefront_ww2_text_unit/font_unit/addr_reg_reg | 2048x8        | Block RAM      | 
h px� 
�
%s*synth2n
l+--------------------+--------------------------------------------------+---------------+----------------+

h px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:27 ; elapsed = 00:00:29 . Memory (MB): peak = 1313.258 ; gain = 803.230
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
~Finished Timing Optimization : Time (s): cpu = 00:00:40 ; elapsed = 00:00:42 . Memory (MB): peak = 1565.445 ; gain = 1055.418
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
0battlefront_ww2_text_unit/font_unit/addr_reg_reg2
BlockZ8-7052h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Technology Mapping : Time (s): cpu = 00:00:40 ; elapsed = 00:00:42 . Memory (MB): peak = 1565.445 ; gain = 1055.418
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2y
wFinished IO Insertion : Time (s): cpu = 00:00:43 ; elapsed = 00:00:45 . Memory (MB): peak = 1639.809 ; gain = 1129.781
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:43 ; elapsed = 00:00:45 . Memory (MB): peak = 1639.809 ; gain = 1129.781
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:43 ; elapsed = 00:00:45 . Memory (MB): peak = 1639.809 ; gain = 1129.781
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:43 ; elapsed = 00:00:45 . Memory (MB): peak = 1639.809 ; gain = 1129.781
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:43 ; elapsed = 00:00:45 . Memory (MB): peak = 1640.750 ; gain = 1130.723
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:43 ; elapsed = 00:00:45 . Memory (MB): peak = 1640.750 ; gain = 1130.723
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|      |BlackBox name |Instances |
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|1     |clk_wiz_0     |         1|
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
:
%s*synth2"
 +------+---------------+------+
h px� 
:
%s*synth2"
 |      |Cell           |Count |
h px� 
:
%s*synth2"
 +------+---------------+------+
h px� 
:
%s*synth2"
 |1     |clk_wiz_0_bbox |     1|
h px� 
:
%s*synth2"
 |2     |CARRY4         |    64|
h px� 
:
%s*synth2"
 |3     |LUT1           |    15|
h px� 
:
%s*synth2"
 |4     |LUT2           |   102|
h px� 
:
%s*synth2"
 |5     |LUT3           |    93|
h px� 
:
%s*synth2"
 |6     |LUT4           |   214|
h px� 
:
%s*synth2"
 |7     |LUT5           |   224|
h px� 
:
%s*synth2"
 |8     |LUT6           |   600|
h px� 
:
%s*synth2"
 |9     |MUXF7          |     6|
h px� 
:
%s*synth2"
 |10    |RAMB18E1       |     1|
h px� 
:
%s*synth2"
 |11    |FDCE           |   105|
h px� 
:
%s*synth2"
 |12    |FDPE           |    21|
h px� 
:
%s*synth2"
 |13    |FDRE           |    12|
h px� 
:
%s*synth2"
 |14    |LD             |     7|
h px� 
:
%s*synth2"
 |15    |IBUF           |     9|
h px� 
:
%s*synth2"
 |16    |OBUF           |    14|
h px� 
:
%s*synth2"
 |17    |OBUFT          |    16|
h px� 
:
%s*synth2"
 +------+---------------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:43 ; elapsed = 00:00:45 . Memory (MB): peak = 1640.750 ; gain = 1130.723
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
a
%s
*synth2I
GSynthesis finished with 0 errors, 0 critical warnings and 21 warnings.
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Runtime : Time (s): cpu = 00:00:37 ; elapsed = 00:00:44 . Memory (MB): peak = 1640.750 ; gain = 1036.457
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:43 ; elapsed = 00:00:45 . Memory (MB): peak = 1640.750 ; gain = 1130.723
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0092

1649.9452
0.000Z17-268h px� 
T
-Analyzing %s Unisim elements for replacement
17*netlist2
78Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1653.6562
0.000Z17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2G
E  A total of 7 instances were transformed.
  LD => LDCE: 7 instances
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

b1e216dbZ4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
432
452
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:452

00:00:492

1653.6562

1333.730Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0022

1653.6562
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2f
dC:/Users/Paulo/Documents/GitHub/Battlefront_WW2/Battlefront_WW2.runs/synth_1/battlefront_ww2_top.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2q
oreport_utilization -file battlefront_ww2_top_utilization_synth.rpt -pb battlefront_ww2_top_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Fri Jan  3 01:21:37 2025Z17-206h px� 


End Record