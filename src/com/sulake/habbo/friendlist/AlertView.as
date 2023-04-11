package com.sulake.habbo.friendlist
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class AlertView implements class_13
   {
      
      private static var var_2521:Dictionary = new Dictionary();
       
      
      private var _friendList:com.sulake.habbo.friendlist.HabboFriendList;
      
      private var var_1869:class_3281;
      
      private var _xmlFileName:String;
      
      private var var_462:String;
      
      private var _disposed:Boolean;
      
      public function AlertView(param1:com.sulake.habbo.friendlist.HabboFriendList, param2:String, param3:String = null)
      {
         super();
         _friendList = param1;
         _xmlFileName = param2;
         var_462 = param3;
      }
      
      public function show() : void
      {
         var _loc1_:class_3281 = class_3281(var_2521[_xmlFileName]);
         if(_loc1_ != null)
         {
            _loc1_.dispose();
         }
         var_1869 = getAlert();
         if(var_462 != null)
         {
            var_1869.caption = var_462;
         }
         setupContent(var_1869.content);
         var _loc2_:Rectangle = Util.getLocationRelativeTo(_friendList.view.mainWindow,var_1869.width,var_1869.height);
         var_1869.x = _loc2_.x;
         var_1869.y = _loc2_.y;
         var_2521[_xmlFileName] = var_1869;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_1869 != null)
         {
            var_1869.destroy();
            var_1869 = null;
         }
         _friendList = null;
      }
      
      internal function setupContent(param1:class_3151) : void
      {
      }
      
      internal function onClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         dispose();
      }
      
      private function getAlert() : class_3281
      {
         var _loc1_:class_3281 = class_3281(_friendList.getXmlWindow(this._xmlFileName));
         var _loc2_:class_3127 = _loc1_.findChildByTag("close");
         _loc2_.procedure = onClose;
         return _loc1_;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get friendList() : com.sulake.habbo.friendlist.HabboFriendList
      {
         return _friendList;
      }
   }
}
