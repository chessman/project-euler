
-module(problem_92).
-export([start/1]).

transform(0) -> 0;
transform(N) ->
    R = N rem 10,
    R * R + transform(N div 10).

test(N,TableId) ->
    test(N, 0, 0,TableId).

test(_,2,_,_) -> 1;
test(_,_,2,_) -> 89;

test(N,N1,N89,TableId) ->
    T = transform(N),
    case ets:lookup(TableId,N) of
        [{_,X}] ->
            X;
        [] ->
            V = if
                T == 1 ->
                    test(T, N1 + 1, N89,TableId);
                T == 89 ->
                    test(T, N1, N89 + 1,TableId);
                true -> 
                    test(T, N1, N89,TableId)
            end,
            ets:insert(TableId, {N,V}),
            V
    end.

start(N) ->
    TableId = ets:new(t, []),
    start(N,0,TableId).

start(0,Res,_) -> Res;
start(N,Res,TableId) ->
    T = test(N,TableId),
    R = if
        T == 89 ->
            1;
        true ->
            0
    end,
    start(N - 1, Res + R, TableId ).
