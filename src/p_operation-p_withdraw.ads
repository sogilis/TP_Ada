with Account; use Account;

package P_Operation.P_Withdraw is

   -------------------------------------------------------------------------------------------------
   type T_Withdraw is new T_Operation with null record;

   -------------------------------------------------------------------------------------------------

   overriding procedure Display (Withdraw : T_Withdraw);

end P_Operation.P_Withdraw;
