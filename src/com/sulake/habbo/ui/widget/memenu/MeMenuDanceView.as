package com.sulake.habbo.ui.widget.memenu
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.tracking.HabboTracking;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetDanceMessage;
   
   public class MeMenuDanceView implements IMeMenuView
   {
       
      
      private var var_1429:com.sulake.habbo.ui.widget.memenu.MeMenuWidget;
      
      private var _window:class_3151;
      
      public function MeMenuDanceView()
      {
         super();
      }
      
      public function init(param1:com.sulake.habbo.ui.widget.memenu.MeMenuWidget, param2:String) : void
      {
         var_1429 = param1;
         createWindow(param2);
      }
      
      public function dispose() : void
      {
         var_1429 = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function get window() : class_3151
      {
         return _window;
      }
      
      private function createWindow(param1:String) : void
      {
         var _loc7_:int = 0;
         var _loc5_:Boolean = false;
         var _loc2_:class_3127 = null;
         var _loc6_:XmlAsset;
         if(_loc6_ = var_1429.assets.getAssetByName("memenu_dance") as XmlAsset)
         {
            _window = var_1429.windowManager.buildFromXML(_loc6_.content as XML) as class_3151;
         }
         if(_window == null)
         {
            throw new Error("Failed to construct dance view window from XML!");
         }
         _window.name = param1;
         var _loc3_:* = [];
         _loc3_.push(_window.findChildByName("stop_dancing_button"));
         _loc3_.push(_window.findChildByName("back_btn"));
         for each(_loc2_ in _loc3_)
         {
            if(_loc2_ != null)
            {
               _loc2_.addEventListener("WME_CLICK",onButtonClicked);
            }
         }
         var _loc8_:IItemListWindow = _window.findChildByName("buttonContainer") as IItemListWindow;
         var _loc4_:XmlAsset = var_1429.assets.getAssetByName("memenu_dance_button") as XmlAsset;
         if(_loc8_ != null)
         {
            _loc7_ = 1;
            while(_loc7_ <= 4)
            {
               _loc5_ = false;
               if(RoomWidgetDanceMessage.const_435.indexOf(_loc7_) >= 0)
               {
                  _loc5_ = false;
               }
               else
               {
                  _loc5_ = true;
               }
               if(_loc5_)
               {
                  _loc2_ = var_1429.windowManager.buildFromXML(_loc4_.content as XML) as class_3127;
                  _loc2_.name = "dance_" + _loc7_ + "_button";
                  _loc2_.caption = "${widget.memenu.dance" + _loc7_ + "}";
                  _loc2_.addEventListener("WME_CLICK",onButtonClicked);
                  _loc8_.addListItemAt(_loc2_,_loc8_.numListItems - 1);
                  if(false)
                  {
                     _loc2_.disable();
                  }
                  else
                  {
                     _loc2_.enable();
                  }
               }
               _loc7_++;
            }
         }
         var _loc9_:class_3127;
         if((_loc9_ = _window.findChildByName("club_info")) != null && false)
         {
            _loc9_.visible = false;
         }
      }
      
      private function onButtonClicked(param1:WindowMouseEvent) : void
      {
         var _loc5_:Array = null;
         var _loc3_:int = 0;
         var _loc2_:class_3127 = param1.target as class_3127;
         var _loc4_:String;
         switch(_loc4_ = _loc2_.name)
         {
            case "dance_1_button":
            case "dance_2_button":
            case "dance_3_button":
            case "dance_4_button":
               _loc5_ = _loc4_.split("_");
               _loc3_ = parseInt(_loc5_[1]);
               var_1429.messageListener.processWidgetMessage(new RoomWidgetDanceMessage(_loc3_));
               var_1429.isDancing = true;
               var_1429.hide();
               HabboTracking.getInstance().trackEventLog("MeMenu","click","dance_start");
               break;
            case "stop_dancing_button":
               var_1429.messageListener.processWidgetMessage(new RoomWidgetDanceMessage(0));
               var_1429.isDancing = false;
               var_1429.hide();
               HabboTracking.getInstance().trackEventLog("MeMenu","click","dance_stop");
               break;
            case "back_btn":
               var_1429.changeView("me_menu_top_view");
               break;
            default:
               class_14.log("Me Menu Dance View: unknown button: " + _loc4_);
         }
      }
      
      public function updateUnseenItemCount(param1:String, param2:int) : void
      {
      }
   }
}
