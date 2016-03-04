package P_Operation is

   -------------------------------------------------------------------------------------------------
   type T_Euro is delta 0.01 range -100_000.00 .. 100_000.00;

   -------------------------------------------------------------------------------------------------
   type T_Operation is abstract tagged record
      Amount : T_Euro;
   end record;

   -------------------------------------------------------------------------------------------------
   type T_Operation_Class_Access is access T_Operation'Class;

   -------------------------------------------------------------------------------------------------
   procedure Display (Operation : T_Operation) is abstract;

end P_Operation;
