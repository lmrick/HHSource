package com.sulake.habbo.game.snowwar.events
{
   import com.sulake.habbo.game.snowwar.arena.ISynchronizedGameEvent;
   import com.sulake.habbo.game.snowwar.arena.class_3327;
   
   public class SnowWarGameEvent implements ISynchronizedGameEvent
   {
       
      
      private var var_311:Boolean = false;
      
      public function SnowWarGameEvent()
      {
         super();
      }
      
      public function apply(param1:class_3327) : void
      {
      }
      
      public function dispose() : void
      {
         var_311 = true;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
   }
}
