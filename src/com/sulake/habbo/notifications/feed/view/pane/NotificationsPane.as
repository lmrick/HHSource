package com.sulake.habbo.notifications.feed.view.pane
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.habbo.notifications.feed.NotificationView;
   import com.sulake.habbo.notifications.feed.view.content.class_3359;
   
   public class NotificationsPane extends AbstractPane
   {
      
      private static const SECTIONS_LIST:String = "list";
      
      private static const const_962:String = "list_urgent";
      
      private static const const_1063:String = "list_actions";
      
      private static const const_1101:String = "list_persistent";
      
      private static const const_1175:String = "list_notifications";
       
      
      private var var_19:IItemListWindow;
      
      public function NotificationsPane(param1:String, param2:NotificationView, param3:class_3151)
      {
         super(param1,param2,param3,1);
         setUp();
      }
      
      override public function dispose() : void
      {
         var_19 = null;
         super.dispose();
      }
      
      private function setUp() : void
      {
         var_19 = _window.findChildByName("list") as IItemListWindow;
      }
      
      public function addItem(param1:int, param2:class_3359) : void
      {
         var _loc3_:IItemListWindow = getSection(param1);
         _loc3_.addListItemAt(param2.window,0);
      }
      
      private function getSection(param1:int) : IItemListWindow
      {
         var _loc2_:String = null;
         switch(param1)
         {
            case 0:
               _loc2_ = "list_urgent";
               break;
            case 1:
               _loc2_ = "list_actions";
               break;
            case 2:
               _loc2_ = "list_persistent";
               break;
            case 3:
               _loc2_ = "list_notifications";
         }
         return var_19.getListItemByName(_loc2_) as IItemListWindow;
      }
   }
}
