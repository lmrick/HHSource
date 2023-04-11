package com.sulake.habbo.help.cfh.registry.instantmessage
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.help.HabboHelp;
   import package_135.class_1114;
   import package_135.class_1408;
   import package_24.class_189;
   import package_24.class_577;
   
   public class InstantMessageEventHandler implements class_13
   {
       
      
      private var var_1460:HabboHelp;
      
      public function InstantMessageEventHandler(param1:HabboHelp)
      {
         super();
         var_1460 = param1;
         var_1460.addMessageEvent(new class_577(onInstantMessage));
         var_1460.addMessageEvent(new class_189(onRoomInvite));
      }
      
      public function onInstantMessage(param1:class_577) : void
      {
         var _loc4_:String = null;
         var _loc3_:String = null;
         var _loc2_:class_1408 = param1.getParser();
         if(_loc2_.senderId < 0 && _loc2_.extraData != null)
         {
            _loc4_ = String(_loc2_.extraData.split("/")[2]);
            _loc3_ = String(_loc2_.extraData.split("/")[0]);
            var_1460.instantMessageRegistry.addItem(_loc2_.senderId,_loc4_ + ":" + _loc3_,_loc2_.messageText);
         }
         else
         {
            var_1460.instantMessageRegistry.addItem(_loc2_.senderId,"",_loc2_.messageText);
         }
      }
      
      public function onRoomInvite(param1:class_189) : void
      {
         var _loc2_:class_1114 = param1.getParser();
         var_1460.instantMessageRegistry.addItem(_loc2_.senderId,"",_loc2_.messageText);
      }
      
      public function dispose() : void
      {
         if(!disposed)
         {
            if(var_1460)
            {
               var_1460 = null;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_1460 == null;
      }
   }
}
