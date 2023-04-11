package com.sulake.habbo.game.snowwar.events
{
   import com.sulake.habbo.game.snowwar.SnowWarEngine;
   import com.sulake.habbo.game.snowwar.arena.class_3327;
   import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
   import com.sulake.habbo.game.snowwar.gameobjects.SnowballGivingGameObject;
   
   public class HumanGetsSnowballsFromMachineEvent extends class_3346
   {
       
      
      private var var_2480:HumanGameObject;
      
      private var var_3059:SnowballGivingGameObject;
      
      public function HumanGetsSnowballsFromMachineEvent(param1:HumanGameObject, param2:SnowballGivingGameObject)
      {
         super();
         var_2480 = param1;
         var_3059 = param2;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_2480 = null;
         var_3059 = null;
      }
      
      override public function apply(param1:class_3327) : void
      {
         var _loc3_:int = 0;
         var _loc2_:HumanGameObject = null;
         var _loc4_:int;
         if((_loc4_ = var_2480.getRemainingSnowballCapacity()) > 0)
         {
            _loc3_ = var_3059.pickupSnowballs(1);
            if(_loc3_ > 0)
            {
               var_2480.addSnowballs(_loc3_);
               _loc2_ = param1.getGameObject(var_2480.ghostObjectId) as HumanGameObject;
               if(_loc2_)
               {
                  _loc2_.addSnowballs(_loc3_);
               }
               SnowWarEngine.playSound("HBSTG_snowwar_get_snowball");
            }
         }
      }
      
      public function get human() : HumanGameObject
      {
         return var_2480;
      }
   }
}
