package com.sulake.habbo.ui.widget.furniture.friendfurni
{
   import com.sulake.core.assets.class_21;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.room.object.data.StringArrayStuffData;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.handler.class_3323;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.window.class_1684;
   
   public class FriendFurniEngravingWidget extends RoomWidgetBase
   {
       
      
      private var _stuffId:int = -1;
      
      private var var_2045:com.sulake.habbo.ui.widget.furniture.friendfurni.FriendFurniEngravingView;
      
      public function FriendFurniEngravingWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21, param4:class_18)
      {
         super(param1,param2,param3,param4);
         engravingWidgetHandler.widget = this;
      }
      
      public function get stuffId() : int
      {
         return _stuffId;
      }
      
      public function get engravingWidgetHandler() : class_3323
      {
         return var_1453 as class_3323;
      }
      
      public function open(param1:int, param2:int, param3:StringArrayStuffData) : void
      {
         close(_stuffId);
         _stuffId = param1;
         switch(param2)
         {
            case 0:
               var_2045 = new LoveLockEngravingView(this,param3);
               break;
            case 1:
            case 2:
               break;
            case 3:
               var_2045 = new WildWestEngravingView(this,param3);
               break;
            case 4:
               var_2045 = new HabboweenEngravingView(this,param3);
         }
         var_2045.open();
      }
      
      public function close(param1:int) : void
      {
         if(param1 == _stuffId && var_2045)
         {
            var_2045.dispose();
            var_2045 = null;
            _stuffId = -1;
         }
      }
   }
}
