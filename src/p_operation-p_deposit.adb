with Ada.Text_IO; use Ada.Text_IO;

package body P_Operation.P_Deposit is

   -------------------------------------------------------------------------------------------------
   procedure Display (Deposit : T_Deposit) is
   begin
      Put_Line ("Deposit of " & T_Euro'Image (Deposit.Amount) & " Euros");
   end Display;

end P_Operation.P_Deposit;
