onbreak resume
onerror resume
vsim -voptargs=+acc work.cordicfsm_fixpt_tb

add wave sim:/cordicfsm_fixpt_tb/u_cordicfsm_fixpt/clk
add wave sim:/cordicfsm_fixpt_tb/u_cordicfsm_fixpt/reset_x
add wave sim:/cordicfsm_fixpt_tb/u_cordicfsm_fixpt/clk_enable
add wave sim:/cordicfsm_fixpt_tb/u_cordicfsm_fixpt/cordic_on
add wave sim:/cordicfsm_fixpt_tb/u_cordicfsm_fixpt/x_in
add wave sim:/cordicfsm_fixpt_tb/u_cordicfsm_fixpt/y_in
add wave sim:/cordicfsm_fixpt_tb/u_cordicfsm_fixpt/ce_out
add wave sim:/cordicfsm_fixpt_tb/u_cordicfsm_fixpt/zz
add wave sim:/cordicfsm_fixpt_tb/zz_ref
add wave sim:/cordicfsm_fixpt_tb/u_cordicfsm_fixpt/r_cordic
add wave sim:/cordicfsm_fixpt_tb/r_cordic_ref
add wave sim:/cordicfsm_fixpt_tb/u_cordicfsm_fixpt/p_cordic
add wave sim:/cordicfsm_fixpt_tb/p_cordic_ref
add wave sim:/cordicfsm_fixpt_tb/u_cordicfsm_fixpt/x_out
add wave sim:/cordicfsm_fixpt_tb/x_out_ref
add wave sim:/cordicfsm_fixpt_tb/u_cordicfsm_fixpt/y_out
add wave sim:/cordicfsm_fixpt_tb/y_out_ref
run -all
