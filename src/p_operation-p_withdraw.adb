with Ada.Text_IO; use Ada.Text_IO;

package body P_Operation.P_Withdraw is

   -------------------------------------------------------------------------------------------------
   procedure Display (Withdraw : T_Withdraw) is
   begin
      Put_Line ("Withdraw of " & T_Euro'Image (Withdraw.Amount) & " Euros");
   end Display;

end P_Operation.P_Withdraw;
