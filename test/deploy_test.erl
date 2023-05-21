%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : dbase using dets 
%%% 
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(deploy_test).   
   
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------

%% External exports
-export([start/0]).



%% ====================================================================
%% External functions
%% ====================================================================

%% --------------------------------------------------------------------
%% Function:tes cases
%% Description: List of test cases 
%% Returns: non
%% --------------------------------------------------------------------
start()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME,?LINE}]),

    ok=setup(),
    ok=test_1(),
 
    io:format("End testing  SUCCESS!! ~p~n",[{?MODULE,?FUNCTION_NAME,?LINE}]),
%    init:stop(),
%    timer:sleep(3000),
    ok.

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
test_1()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME,?LINE}]),

    %% create 
    
    DeployId="deploy_id_1",
    ProviderId="kube_appl",
    Node=list_to_atom(DeployId++"@"++"host1"),
    Dir="kube_appl_dir_1",
    CreationTime={date(),time()},
    false=db_deploy:member(DeployId),
    {atomic,ok}=db_deploy:create(DeployId,ProviderId,Node,Dir,CreationTime),
    true=db_deploy:member(DeployId),
    {
     "deploy_id_1","kube_appl",'deploy_id_1@host1',"kube_appl_dir_1",
     {_,_}
    }=db_deploy:read(DeployId),
    
    {atomic,ok}=db_deploy:delete(DeployId),
    false=db_deploy:member(DeployId),
    


    ok. 
%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
setup()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME,?LINE}]),

    ok.
