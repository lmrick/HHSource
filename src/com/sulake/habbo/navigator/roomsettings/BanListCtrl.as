package com.sulake.habbo.navigator.roomsettings
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.navigator.class_1686;
   
   public class BanListCtrl extends UserListCtrl
   {
       
      
      private var var_3182:int = -1;
      
      public function BanListCtrl(param1:class_1686)
      {
         super(param1,false);
      }
      
      override protected function getRowView() : class_3151
      {
         return class_3151(_navigator.getXmlWindow("ros_banned_user"));
      }
      
      override protected function onBgMouseClick(param1:class_3134) : void
      {
         var_3182 = param1.target.parent.id;
         refreshColorsAfterClick(param1.target.findParentByName("moderation_banned_users") as IItemListWindow);
      }
      
      override protected function getBgColor(param1:int, param2:Boolean) : uint
      {
         if(param1 == var_3182)
         {
            return 4288329945;
         }
         return super.getBgColor(param1,param2);
      }
      
      private function refreshColorsAfterClick(param1:IItemListWindow) : void
      {
         var _loc3_:int = 0;
         var _loc2_:class_3151 = null;
         _loc3_ = 0;
         while(_loc3_ < var_392)
         {
            _loc2_ = class_3151(param1.getListItemAt(_loc3_));
            _loc2_.color = this.getBgColor(_loc3_,false);
            _loc3_++;
         }
      }
      
      public function get selectedRow() : int
      {
         return var_3182;
      }
   }
}
