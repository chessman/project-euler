
-module(problem_57).
-export([start/1]).

new(N,TableId) ->
            case ets:lookup(TableId,N) of
                [{_,X}] -> X;
                [] ->
                    V = 2 * new(N-1,TableId) + new(N-2,TableId),
                    ets:insert(TableId,{N,V}),
                    V
            end.

new(Init) ->
    TableId = ets:new(p, []),
    ets:insert(TableId,Init),
    fun(N) -> new(N,TableId) end.

digits(N) when N < 10 -> 1;
digits(N) -> 1 + digits(N div 10).

start(N) ->
    P = new( [{-1,1},{0,1}] ),
    Q = new( [{-1,0},{0,1}] ),
    start(N,0,P,Q).

start(0,Res,_,_) -> Res;
start(N,Res,P,Q) ->
    case digits(P(N)) > digits(Q(N)) of
        false -> start(N - 1, Res,P,Q);
        true -> start(N - 1, Res + 1,P,Q)
    end.
