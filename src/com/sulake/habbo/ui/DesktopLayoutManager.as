package com.sulake.habbo.ui
{
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3207;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.class_1684;
   import flash.geom.Rectangle;
   
   public class DesktopLayoutManager
   {
      
      private static const ROOM_VIEW:String = "room_view";
      
      private static const ROOM_NEW_CHAT:String = "room_new_chat";
      
      private static const ROOM_WIDGET:String = "room_widget";
      
      private static const BOTTOM_MARGIN:int = 47;
       
      
      private var _layoutContainer:class_3151;
      
      public function DesktopLayoutManager()
      {
         super();
      }
      
      public function dispose() : void
      {
         if(_layoutContainer != null)
         {
            _layoutContainer.dispose();
         }
      }
      
      public function setLayout(param1:XML, param2:class_1684, param3:class_19) : void
      {
         var _loc7_:class_3127 = null;
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         if(param1 == null || param2 == null)
         {
            throw new Error("Unable to set room desktop layout.");
         }
         _layoutContainer = param2.buildFromXML(param1,0) as class_3151;
         if(_layoutContainer == null)
         {
            throw new Error("Failed to build layout from XML.");
         }
         _layoutContainer.width = _layoutContainer.desktop.width;
         _layoutContainer.height = _layoutContainer.desktop.height;
         var _loc4_:class_3151;
         (_loc4_ = _layoutContainer.desktop as class_3151).addChild(_layoutContainer);
         _layoutContainer.findChildByTag("room_widget_infostand").y = _layoutContainer.findChildByTag("room_widget_infostand").y - 47;
         _loc6_ = 0;
         while(_loc6_ < _layoutContainer.numChildren)
         {
            _loc7_ = _layoutContainer.getChildAt(_loc6_);
            _loc5_ = 1048576;
            if(_loc7_.testParamFlag(_loc5_))
            {
               _loc7_.addEventListener("WE_CHILD_RESIZED",trimContainer);
            }
            _loc6_++;
         }
      }
      
      private function trimContainer(param1:class_3134) : void
      {
         var _loc2_:class_3151 = param1.window as class_3151;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.numChildren != 1)
         {
            return;
         }
         var _loc3_:class_3127 = _loc2_.getChildAt(0);
         if(_loc3_ == null)
         {
            return;
         }
         _loc2_.width = _loc3_.width;
         _loc2_.height = _loc3_.height;
      }
      
      private function getWidgetContainer(param1:String, param2:class_3127) : class_3151
      {
         var _loc7_:* = null;
         var _loc3_:* = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         if(param2 == null)
         {
            return null;
         }
         if(param1 == "RWE_HIGH_SCORE_DISPLAY" || param1 == "RWE_WORD_QUIZZ")
         {
            return _layoutContainer.getChildByName("background_widgets") as class_3151;
         }
         if(param1 == "RWE_CHAT_INPUT_WIDGET")
         {
            return param2.desktop as class_3151;
         }
         var _loc8_:Array = param2.tags;
         _loc6_ = 0;
         while(_loc6_ < _loc8_.length)
         {
            if(String(_loc8_[_loc6_]).indexOf("room_widget") == 0)
            {
               _loc5_ = _loc8_[_loc6_] as String;
               break;
            }
            _loc6_++;
         }
         if(_loc5_ == null)
         {
            return null;
         }
         return _layoutContainer.getChildByTag(_loc5_) as class_3151;
      }
      
      public function addWidgetWindow(param1:String, param2:class_3127) : Boolean
      {
         if(param2 == null)
         {
            return false;
         }
         var _loc3_:class_3151 = getWidgetContainer(param1,param2);
         if(_loc3_ == null)
         {
            return false;
         }
         if(param1 == "RWE_CHAT_INPUT_WIDGET")
         {
            _loc3_.addChild(param2);
            return true;
         }
         param2.x = 0;
         param2.y = 0;
         _loc3_.addChild(param2);
         _loc3_.width = param2.width;
         _loc3_.height = param2.height;
         return true;
      }
      
      public function removeWidgetWindow(param1:String, param2:class_3127) : void
      {
         var _loc3_:class_3151 = getWidgetContainer(param1,param2);
         if(_loc3_ != null)
         {
            _loc3_.removeChild(param2);
         }
      }
      
      public function addRoomView(param1:class_3127) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:class_3151 = _layoutContainer.getChildByTag("room_view") as class_3151;
         if(_loc2_ == null)
         {
            return false;
         }
         _loc2_.addChild(param1);
         return true;
      }
      
      public function get roomViewRect() : Rectangle
      {
         if(_layoutContainer == null)
         {
            return null;
         }
         var _loc1_:class_3151 = _layoutContainer.findChildByTag("room_view") as class_3151;
         if(!_loc1_)
         {
            return null;
         }
         var _loc2_:Rectangle = _loc1_.rectangle;
         if(!_loc2_)
         {
            return null;
         }
         _loc2_.offset(_layoutContainer.x,_layoutContainer.y);
         return _loc2_;
      }
      
      public function getRoomView() : class_3127
      {
         if(_layoutContainer == null)
         {
            return null;
         }
         var _loc1_:class_3151 = _layoutContainer.findChildByTag("room_view") as class_3151;
         if(_loc1_ != null && _loc1_.numChildren > 0)
         {
            return _loc1_.getChildAt(0);
         }
         return null;
      }
      
      public function getChatContainer() : class_3207
      {
         if(_layoutContainer == null)
         {
            return null;
         }
         return _layoutContainer.findChildByTag("room_new_chat") as class_3207;
      }
   }
}
