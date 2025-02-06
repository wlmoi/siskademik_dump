% loggingMode - mode of operation : either read or log
%#codegen
%#internal
function loggedData = cordicfsm_fixpt_logger(varargin)
    coder.inline( 'never' );
    coder.extrinsic( 'MException', 'throw' );
    persistent iterCount
    if isempty( iterCount )
        iterCount = 0;
    end
    if nargin>0
        % Log the data.
        Cordic_on_TB_logger( varargin{ 1 } );
        x_in_TB_logger( varargin{ 2 } );
        y_in_TB_logger( varargin{ 3 } );
        Z_TB_logger( varargin{ 4 } );
        r_cordic_TB_logger( varargin{ 5 } );
        p_cordic_TB_logger( varargin{ 6 } );
        x_out_TB_logger( varargin{ 7 } );
        y_out_TB_logger( varargin{ 8 } );
        iterCount = iterCount + 1;
        loggedData = [  ];
        if iterCount>=Inf
            throw( MException( 'Coder:FXPCONV:MATLABSimBailOut', 'Return early for input computation' ) );
        end
        return
    else
        % Fetch the data.
        % make sure the 'log setup' has been performed
        assert( ~isempty( iterCount ) );
        loggedData.inputs.Cordic_on = Cordic_on_TB_logger();
        loggedData.inputs.x_in = x_in_TB_logger();
        loggedData.inputs.y_in = y_in_TB_logger();
        loggedData.outputs.Z = Z_TB_logger();
        loggedData.outputs.r_cordic = r_cordic_TB_logger();
        loggedData.outputs.p_cordic = p_cordic_TB_logger();
        loggedData.outputs.x_out = x_out_TB_logger();
        loggedData.outputs.y_out = y_out_TB_logger();
        loggedData.iterCount = iterCount;
    end
end
function out = Cordic_on_TB_logger(v)
    coder.inline( 'never' );
    persistent p
    coder.varsize( 'p' );
    if nargin==1
        if isempty( p )
            p = loggableValue( v );
        elseif isrow( v )
            p = [ p, loggableValue( v ) ];
        else
            p = [ p; loggableValue( v ) ];
        end
    else
        assert( ~isempty( p ) );
        out = p;
        p( : ) = [  ];
    end
end
function out = x_in_TB_logger(v)
    coder.inline( 'never' );
    persistent p
    coder.varsize( 'p' );
    if nargin==1
        if isempty( p )
            p = loggableValue( v );
        elseif isrow( v )
            p = [ p, loggableValue( v ) ];
        else
            p = [ p; loggableValue( v ) ];
        end
    else
        assert( ~isempty( p ) );
        out = p;
        p( : ) = [  ];
    end
end
function out = y_in_TB_logger(v)
    coder.inline( 'never' );
    persistent p
    coder.varsize( 'p' );
    if nargin==1
        if isempty( p )
            p = loggableValue( v );
        elseif isrow( v )
            p = [ p, loggableValue( v ) ];
        else
            p = [ p; loggableValue( v ) ];
        end
    else
        assert( ~isempty( p ) );
        out = p;
        p( : ) = [  ];
    end
end
function out = Z_TB_logger(v)
    coder.inline( 'never' );
    persistent p
    coder.varsize( 'p' );
    if nargin==1
        if isempty( p )
            p = loggableValue( v );
        elseif isrow( v )
            p = [ p, loggableValue( v ) ];
        else
            p = [ p; loggableValue( v ) ];
        end
    else
        assert( ~isempty( p ) );
        out = p;
        p( : ) = [  ];
    end
end
function out = r_cordic_TB_logger(v)
    coder.inline( 'never' );
    persistent p
    coder.varsize( 'p' );
    if nargin==1
        if isempty( p )
            p = loggableValue( v );
        elseif isrow( v )
            p = [ p, loggableValue( v ) ];
        else
            p = [ p; loggableValue( v ) ];
        end
    else
        assert( ~isempty( p ) );
        out = p;
        p( : ) = [  ];
    end
end
function out = p_cordic_TB_logger(v)
    coder.inline( 'never' );
    persistent p
    coder.varsize( 'p' );
    if nargin==1
        if isempty( p )
            p = loggableValue( v );
        elseif isrow( v )
            p = [ p, loggableValue( v ) ];
        else
            p = [ p; loggableValue( v ) ];
        end
    else
        assert( ~isempty( p ) );
        out = p;
        p( : ) = [  ];
    end
end
function out = x_out_TB_logger(v)
    coder.inline( 'never' );
    persistent p
    coder.varsize( 'p' );
    if nargin==1
        if isempty( p )
            p = loggableValue( v );
        elseif isrow( v )
            p = [ p, loggableValue( v ) ];
        else
            p = [ p; loggableValue( v ) ];
        end
    else
        assert( ~isempty( p ) );
        out = p;
        p( : ) = [  ];
    end
end
function out = y_out_TB_logger(v)
    coder.inline( 'never' );
    persistent p
    coder.varsize( 'p' );
    if nargin==1
        if isempty( p )
            p = loggableValue( v );
        elseif isrow( v )
            p = [ p, loggableValue( v ) ];
        else
            p = [ p; loggableValue( v ) ];
        end
    else
        assert( ~isempty( p ) );
        out = p;
        p( : ) = [  ];
    end
end
function out = loggableValue(in)
    coder.inline( 'always' );
    if isenum( in )
        out = double( in );
    else
        out = in;
    end
end
