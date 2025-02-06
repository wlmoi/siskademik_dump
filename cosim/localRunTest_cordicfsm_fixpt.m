function localRunTest_cordicfsm_fixpt
   fxptPath = 'D:\Matlab\W_exports\cordicfsm\codegen\cordicfsm\fixpt';
addpath(fxptPath);
cleanupObj = onCleanup(@() rmpath(fxptPath));

   test_cordicfsm_cosim;
end

