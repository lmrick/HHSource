package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.utils.class_24;
   import package_184.SnowWarGameEventData;
   
   public class GameStatusData
   {
       
      
      private var var_1331:int;
      
      private var var_1239:int;
      
      private var var_618:class_24;
      
      public function GameStatusData(param1:IMessageDataWrapper)
      {
         super();
         parse(param1);
      }
      
      public function get turn() : int
      {
         return var_1331;
      }
      
      public function get checksum() : int
      {
         return var_1239;
      }
      
      public function get events() : class_24
      {
         return var_618;
      }
      
      public function parse(param1:IMessageDataWrapper) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc8_:* = null;
         var _loc7_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:SnowWarGameEventData = null;
         var_1331 = param1.readInteger();
         var_1239 = param1.readInteger();
         var_618 = new class_24();
         var _loc2_:int = param1.readInteger();
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc6_ = param1.readInteger();
            _loc8_ = [];
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc3_ = param1.readInteger();
               if(_loc4_ = SnowWarGameEventData.create(_loc3_))
               {
                  _loc4_.parse(param1);
                  _loc8_.push(_loc4_);
               }
               _loc7_++;
            }
            var_618.add(_loc5_,_loc8_);
            _loc5_++;
         }
      }
   }
}
