%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%          Generated by MATLAB 24.2 and Fixed-Point Designer 24.2          %
%                                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Z,r_cordic,p_cordic,x_out,y_out] = cordicfsm_wrapper_fixpt_cosim(Cordic_on,x_in,y_in)
    fm = get_fimath();
    Cordic_on_in = fi( Cordic_on, 0, 1, 0, fm );
    x_in_in = fi( x_in, 0, 9, 0, fm );
    y_in_in = fi( y_in, 0, 9, 0, fm );
    [Z_out,r_cordic_out,p_cordic_out,x_out_out,y_out_out] = cordicfsm_fixpt_cosim( Cordic_on_in, x_in_in, y_in_in );
    Z = Z_out;
    r_cordic = double( r_cordic_out );
    p_cordic = double( p_cordic_out );
    x_out = double( x_out_out );
    y_out = double( y_out_out );
end
function fm = get_fimath
    fm = fimath( 'RoundingMethod', 'Floor', 'OverflowAction', 'Wrap', 'ProductMode', 'FullPrecision', 'MaxProductWordLength', 128, 'SumMode', 'FullPrecision', 'MaxSumWordLength', 128 );
end
