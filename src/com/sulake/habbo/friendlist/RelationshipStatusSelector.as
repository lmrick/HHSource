package com.sulake.habbo.friendlist
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.class_3213;
   import com.sulake.core.window.events.class_3134;
   import flash.geom.Point;
   
   public class RelationshipStatusSelector implements class_13
   {
       
      
      private var _friendList:com.sulake.habbo.friendlist.HabboFriendList;
      
      private var _window:class_3213;
      
      private var var_930:int;
      
      private var _disposed:Boolean = false;
      
      public function RelationshipStatusSelector(param1:com.sulake.habbo.friendlist.HabboFriendList)
      {
         super();
         _friendList = param1;
         createWindow();
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            destroyWindow();
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function appearAt(param1:class_3127, param2:class_3127) : void
      {
         var _loc3_:Point = new Point();
         param1.getGlobalPosition(_loc3_);
         _window.x = _loc3_.x;
         _window.y = _loc3_.y;
         _window.visible = true;
         _window.activate();
      }
      
      public function disappear() : void
      {
         _window.visible = false;
      }
      
      public function set friendId(param1:int) : void
      {
         var_930 = param1;
      }
      
      private function createWindow() : void
      {
         _window = class_3213(_friendList.windowManager.buildFromXML(XML(_friendList.assets.getAssetByName("relationship_chooser_xml").content)));
         _window.procedure = onWindowEvent;
         _window.visible = false;
      }
      
      private function destroyWindow() : void
      {
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      private function onWindowEvent(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            switch(param2.name)
            {
               case "item_none":
                  _friendList.setRelationshipStatus(var_930,0);
                  break;
               case "item_heart":
                  _friendList.setRelationshipStatus(var_930,1);
                  break;
               case "item_smile":
                  _friendList.setRelationshipStatus(var_930,2);
                  break;
               case "item_bobba":
                  _friendList.setRelationshipStatus(var_930,3);
            }
            _window.visible = false;
         }
         if(param1.type == "WE_UNFOCUSED")
         {
            _window.visible = false;
         }
      }
   }
}
