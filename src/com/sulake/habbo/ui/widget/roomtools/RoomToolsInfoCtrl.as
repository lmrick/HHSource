package com.sulake.habbo.ui.widget.roomtools
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.core.window.motion.Callback;
   import com.sulake.core.window.motion.EaseOut;
   import com.sulake.core.window.motion.Motion;
   import com.sulake.core.window.motion.MoveTo;
   import com.sulake.core.window.motion.Queue;
   import com.sulake.core.window.motion.class_3353;
   import com.sulake.habbo.window.class_1684;
   import flash.geom.Point;
   
   public class RoomToolsInfoCtrl extends RoomToolsCtrlBase
   {
      
      private static const MARGIN:int = 12;
      
      private static const TAG_COLOR:uint = 1800619;
      
      private static const TAG_COLOR_HOVER:uint = 4696294;
       
      
      private var var_2421:Array;
      
      public function RoomToolsInfoCtrl(param1:RoomToolsWidget, param2:class_1684, param3:class_21)
      {
         super(param1,param2,param3);
         var_2421 = [];
      }
      
      public function showRoomInfo(param1:Boolean, param2:String, param3:String, param4:Array) : void
      {
         if(!_window)
         {
            _window = var_1429.windowManager.buildFromXML(_assets.getAssetByName("room_tools_info_xml").content as XML) as class_3151;
            _window.procedure = onWindowEvent;
            _window.addEventListener("WME_OVER",onWindowEvent);
            _window.addEventListener("WME_OUT",onWindowEvent);
         }
         updatePosition();
         _window.findChildByName("room_name").caption = param2;
         _window.findChildByName("room_owner").caption = param3;
         if(param4 == null)
         {
            return;
         }
         var_2421 = param4;
         _window.findChildByName("tag1_border").visible = param4.length >= 1;
         _window.findChildByName("tag2_border").visible = param4.length >= 2;
         if(param4.length >= 1)
         {
            _window.findChildByName("tag1").caption = "#" + trimTag(param4[0]);
         }
         if(param4.length >= 2)
         {
            _window.findChildByName("tag2").caption = "#" + trimTag(param4[1]);
         }
         setCollapsed(false);
      }
      
      public function updatePosition() : void
      {
         if(!_window)
         {
            return;
         }
         var _loc2_:int = (var_1597 ? 0 : 0) + var_1429.getRoomToolbarRight() + 12;
         var _loc1_:int = _window.desktop.height - 55 - 0;
         var _loc3_:int = var_1429.getChatInputY();
         if(_loc3_ < _loc1_ + _window.height)
         {
            _loc1_ = _loc3_ - 0 - 12;
         }
         _window.position = new Point(_loc2_,_loc1_);
      }
      
      override public function setCollapsed(param1:Boolean) : void
      {
         var _loc2_:Motion = null;
         if(var_1597 == param1)
         {
            return;
         }
         var_1597 = param1;
         if(!var_1597)
         {
            collapseAfterDelay();
         }
         if(!_window)
         {
            return;
         }
         _window.visible = true;
         var _loc3_:int = (var_1597 ? 0 : 0) + var_1429.getRoomToolbarRight() + 12;
         if(var_1597)
         {
            _loc2_ = new Queue(new EaseOut(new MoveTo(_window,100,_loc3_,_window.y),1),new Callback(motionComplete));
         }
         else
         {
            _loc2_ = new Queue(new EaseOut(new MoveTo(_window,100,_loc3_,_window.y),1),new Callback(motionComplete));
         }
         class_3353.runMotion(_loc2_);
      }
      
      public function setToolbarCollapsed(param1:Boolean) : void
      {
         if(!_window)
         {
            return;
         }
         setCollapsed(param1);
         var _loc2_:Motion = new EaseOut(new MoveTo(_window,100,var_1429.getRoomToolbarRight() + 12,_window.y),1);
         class_3353.runMotion(_loc2_);
      }
      
      private function motionComplete(param1:Motion) : void
      {
         if(var_1597 && _window)
         {
            _window.visible = false;
         }
      }
      
      private function trimTag(param1:String) : String
      {
         var _loc2_:* = param1;
         if(_loc2_.length > 16)
         {
            _loc2_ = _loc2_.substr(0,16) + "...";
         }
         return _loc2_;
      }
      
      private function onWindowEvent(param1:class_3134, param2:class_3127) : void
      {
         var _loc4_:ITextWindow = null;
         var _loc3_:String = null;
         if(param1.type == "WE_PARENT_RESIZED")
         {
            return updatePosition();
         }
         switch(param1.type)
         {
            case "WME_CLICK":
               setCollapsed(true);
               break;
            case "WME_OVER":
               cancelWindowCollapse();
               break;
            case "WME_OUT":
               collapseIfPending();
         }
         if(param1 as WindowMouseEvent == null)
         {
            return;
         }
         if(param2.name == "tag1_region")
         {
            _loc4_ = _window.findChildByName("tag1") as ITextWindow;
            _loc3_ = String(var_2421[0] == null ? "" : var_2421[0]);
         }
         if(param2.name == "tag2_region")
         {
            _loc4_ = _window.findChildByName("tag2") as ITextWindow;
            _loc3_ = String(var_2421[1] == null ? "" : var_2421[1]);
         }
         if(_loc4_ != null)
         {
            switch(param1.type)
            {
               case "WME_HOVERING":
               case "WME_OVER":
                  _loc4_.textColor = 4696294;
                  break;
               case "WME_OUT":
                  _loc4_.textColor = 1800619;
                  break;
               case "WME_CLICK":
                  handler.navigator.performTagSearch(_loc3_);
            }
         }
      }
      
      public function get right() : int
      {
         return !!_window ? NaN : 0;
      }
   }
}
