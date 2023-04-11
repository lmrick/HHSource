package com.sulake.habbo.game.snowwar.events
{
   import com.sulake.habbo.game.snowwar.arena.class_3327;
   import com.sulake.habbo.game.snowwar.gameobjects.SnowballMachineGameObject;
   
   public class MachineCreatesSnowballEvent extends class_3346
   {
       
      
      private var var_3059:SnowballMachineGameObject;
      
      public function MachineCreatesSnowballEvent(param1:SnowballMachineGameObject)
      {
         super();
         var_3059 = param1;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_3059 = null;
      }
      
      override public function apply(param1:class_3327) : void
      {
         if(var_3059)
         {
            var_3059.createSnowball();
         }
         else
         {
            HabboGamesCom.log("Too early for this stuff..");
         }
      }
   }
}
