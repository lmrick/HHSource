package com.sulake.habbo.friendlist
{
   import com.sulake.core.window.class_3151;
   import flash.events.Event;
   import flash.utils.Timer;
   
   public class OpenedToWebPopup
   {
       
      
      private var _friendList:com.sulake.habbo.friendlist.HabboFriendList;
      
      private var var_1869:class_3151;
      
      private var var_1635:Timer;
      
      public function OpenedToWebPopup(param1:com.sulake.habbo.friendlist.HabboFriendList)
      {
         super();
         _friendList = param1;
      }
      
      public function show(param1:int, param2:int) : void
      {
         if(var_1869 != null)
         {
            close(null);
         }
         var_1869 = getOpenedToWebAlert();
         if(var_1635 != null)
         {
            var_1635.stop();
         }
         var_1635 = new Timer(2000,1);
         var_1635.addEventListener("timer",close);
         var_1635.start();
         var_1869.x = param1;
         var_1869.y = param2;
      }
      
      private function close(param1:Event) : void
      {
         var_1869.destroy();
         var_1869 = null;
      }
      
      private function getOpenedToWebAlert() : class_3151
      {
         var _loc1_:class_3151 = class_3151(_friendList.getXmlWindow("opened_to_web_popup"));
         _friendList.refreshButton(_loc1_,"opened_to_web",true,null,0);
         return _loc1_;
      }
   }
}
