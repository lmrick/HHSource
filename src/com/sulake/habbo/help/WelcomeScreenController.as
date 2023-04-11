package com.sulake.habbo.help
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WelcomeScreenController implements class_41
   {
       
      
      private var _habboHelp:com.sulake.habbo.help.HabboHelp;
      
      private var _disposed:Boolean;
      
      private var _window:class_3151;
      
      private var var_1609:Point;
      
      private var var_3542:String;
      
      private var var_3422:int;
      
      private var var_3490:String;
      
      public function WelcomeScreenController(param1:com.sulake.habbo.help.HabboHelp)
      {
         var_1609 = new Point(72,10);
         super();
         _habboHelp = param1;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_habboHelp)
         {
            _habboHelp.removeUpdateReceiver(this);
            _habboHelp = null;
         }
         if(_window)
         {
            _window.findChildByName("close").removeEventListener("WME_CLICK",onCloseButton);
            _window.findChildByName("click").removeEventListener("WME_CLICK",onRegionClick);
            _window.dispose();
            _window = null;
         }
         _disposed = true;
      }
      
      public function showWelcomeScreen(param1:String, param2:String, param3:int, param4:String) : void
      {
         if(_disposed)
         {
            return;
         }
         var_3542 = param1;
         var_3422 = param3;
         var_3490 = param4;
         if(_window == null)
         {
            initializeWindow();
         }
         var _loc5_:ITextWindow;
         (_loc5_ = ITextWindow(_window.findChildByName("text"))).caption = "${" + param2 + "}";
         _loc5_.height = _loc5_.textHeight + 5;
         updatePosition();
         this.registerUpdates();
         _window.visible = true;
         _window.activate();
      }
      
      private function initializeWindow() : void
      {
         var _loc1_:XmlAsset = _habboHelp.assets.getAssetByName("welcome_screen_xml") as XmlAsset;
         _window = _habboHelp.windowManager.buildFromXML(_loc1_.content as XML,2) as class_3151;
         var _loc3_:class_3281 = _window.findChildByName("frame") as class_3281;
         _loc3_.header.visible = false;
         _loc3_.content.y -= 20;
         var _loc2_:ITextWindow = _window.findChildByName("text") as ITextWindow;
         _loc2_.height = _loc2_.textHeight + 5;
         _loc3_.content.setParamFlag(2048,false);
         _loc3_.height -= 20;
         _window.findChildByName("close").addEventListener("WME_CLICK",onCloseButton);
         _window.findChildByName("click").addEventListener("WME_CLICK",onRegionClick);
      }
      
      private function updatePosition() : void
      {
         var _loc1_:Rectangle = _habboHelp.toolbar.getIconLocation(var_3542);
         var _loc2_:class_3127 = _window.findChildByName("arrow");
         var _loc3_:class_3127 = _window.findChildByName("arrow_right");
         if(_loc1_ == null)
         {
            _loc1_ = new Rectangle(0,0,_window.width,_window.height);
         }
         if(var_3422 == 0)
         {
            var_1609.x = 72;
            _window.x = 0;
            _loc2_.y = (0 - _loc2_.height) / 2;
            _loc2_.visible = true;
            _loc3_.visible = false;
         }
         else
         {
            var_1609.x = _loc1_.x - 0;
            _window.x = _loc1_.x + _loc1_.width + _window.width;
            _loc3_.y = (0 - _loc2_.height) / 2;
            _loc3_.visible = true;
            _loc2_.visible = false;
         }
         if(_loc1_ != null)
         {
            var_1609.y = _loc1_.y + _loc1_.height / 2 - 0;
         }
         else
         {
            var_1609.y = 0;
         }
         _window.y = var_1609.y;
      }
      
      private function onCloseButton(param1:WindowMouseEvent) : void
      {
         closeWindow();
      }
      
      private function onRegionClick(param1:WindowMouseEvent) : void
      {
         if(var_3490 != null)
         {
            _habboHelp.toolbar.toggleWindowVisibility(var_3490);
         }
         closeWindow();
      }
      
      private function closeWindow() : void
      {
         if(!_window)
         {
            return;
         }
         _window.visible = false;
         dispose();
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:Point = null;
         if(_window == null)
         {
            _habboHelp.removeUpdateReceiver(this);
            return;
         }
         var _loc2_:Number = Point.distance(_window.position,var_1609);
         if(_loc2_ > 5)
         {
            _loc3_ = Point.interpolate(_window.position,var_1609,0.5);
            _window.x = _loc3_.x;
            _window.y = _loc3_.y;
         }
         else
         {
            _window.x = var_1609.x;
            _window.y = var_1609.y;
            _habboHelp.removeUpdateReceiver(this);
         }
      }
      
      private function registerUpdates() : void
      {
         _habboHelp.removeUpdateReceiver(this);
         _habboHelp.registerUpdateReceiver(this,10);
      }
      
      public function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         var _loc2_:Rectangle = null;
         if(_disposed)
         {
            return;
         }
         switch(param1.type)
         {
            case "HTE_RESIZED":
               if(_habboHelp != null)
               {
                  _loc2_ = _habboHelp.toolbar.getIconLocation(var_3542);
               }
               if(_loc2_ != null)
               {
                  var_1609.y = _loc2_.y + _loc2_.height / 2 - 0;
                  _window.y = var_1609.y;
                  break;
               }
               break;
            case "HTE_TOOLBAR_CLICK":
            case "HTE_GROUP_ROOM_INFO_CLICK":
               closeWindow();
         }
      }
   }
}
