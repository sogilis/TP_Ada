with Account; use Account;

package P_Operation.P_Transfer is

   -------------------------------------------------------------------------------------------------
   type T_Transfer is new T_Operation with record
        Ptr_Transmitter : Pointer_Account;
        Ptr_Payee       : Pointer_Account;
     end record;

     -------------------------------------------------------------------------------------------------
     overriding procedure Display (Transfer : T_Transfer);

end P_Operation.P_Transfer;
