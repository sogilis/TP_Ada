with Account; use Account;


package P_Operation.P_Transfer is


   procedure Make_Transfer
     (Amount      :        T_Euro := 0.00;
      Transmitter : in out T_Account;
      Payee       : in out T_Account);

end P_Operation.P_Transfer;
