with Ada.Text_IO; use Ada.Text_IO;

package body P_Operation.P_Transfer is

   -------------------------------------------------------------------------------------------------
   procedure Display (Transfer : T_Transfer) is
   begin
      Put ("Transfer of " & T_Euro'Image (Transfer.Amount) & " Euros");
      Put
        (" from account number " &
         Positive'Image (Transfer.Ptr_Transmitter.ID));
      Put_Line
        (" to account number " & Positive'Image (Transfer.Ptr_Payee.ID));
   end Display;

end P_Operation.P_Transfer;
