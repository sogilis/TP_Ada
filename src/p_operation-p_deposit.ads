with Account; use Account;

package P_Operation.P_Deposit is

   -------------------------------------------------------------------------------------------------
   type T_Deposit is new T_Operation with null record;

   -------------------------------------------------------------------------------------------------
   overriding procedure Display (Deposit : T_Deposit);

end P_Operation.P_Deposit;
