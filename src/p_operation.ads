package P_Operation is

   -------------------------------------------------------------------------------------------------
   type T_Euro is delta 0.01 range -100_000.00 .. 100_000.00;

   -------------------------------------------------------------------------------------------------
   type T_Operation is abstract tagged record
      Amount : T_Euro;
   end record;

   procedure Display_Operation(Operation : T_Operation) is abstract;

end P_Operation;
