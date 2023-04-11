package com.sulake.habbo.ui.widget.furniture.highscore
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3349;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.room.object.data.HighScoreData;
   import com.sulake.habbo.room.object.data.class_1663;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.handler.class_3331;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.window.class_1684;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class HighScoreDisplayWidget extends RoomWidgetBase
   {
      
      public static const INVALID_ID:int = -1;
      
      private static const RELATIVE_OFFSET_X:int = -138;
      
      private static const RELATIVE_OFFSET_Y:int = -400;
      
      private static const SCORETYPE_ONE_PER_TEAM:int = 0;
      
      private static const SCORETYPE_AGGREGATED_WINS:int = 1;
      
      private static const SCORETYPE_ALWAYS_NEW_SCORE:int = 2;
      
      private static const CLEARTYPE_NEVER:int = 0;
      
      private static const CLEARTYPE_DAILY:int = 1;
      
      private static const CLEARTYPE_WEEKLY:int = 2;
      
      private static const CLEARTYPE_MONTHLY:int = 3;
      
      private static const SCORETYPE_LOCALIZATION_KEY_POSTFIX:Array = ["perteam","mostwins","classic","fastesttime","longesttime"];
      
      private static const CLEARTYPE_LOCALIZATION_KEY_POSTFIX:Array = ["alltime","daily","weekly","monthly"];
       
      
      private var var_1996:class_3151;
      
      private var _bubble:class_3349;
      
      private var var_3301:class_3151;
      
      private var var_354:int = -1;
      
      private var var_3287:int = -1;
      
      private var _lastPosition:Point;
      
      public function HighScoreDisplayWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21 = null, param4:class_18 = null)
      {
         _lastPosition = new Point(0,0);
         super(param1,param2,param3,param4);
         class_3331(param1).widget = this;
         var_1996 = class_3151(param2.createWindow("room_widget_highscore_background_container","",4,0,0,new Rectangle(0,0,10,10)));
         resizeRootContainerToDesktop();
         var_1996.addEventListener("WE_PARENT_RESIZED",resizeRootContainerToDesktop);
      }
      
      private static function scoreToTime(param1:int, param2:int) : String
      {
         var _loc3_:int = 0;
         var _loc6_:String = null;
         var _loc5_:* = [60,60,24];
         if(param2 < 1 || param2 > _loc5_.length)
         {
            return param1 + "";
         }
         var _loc4_:String = "";
         _loc3_ = 0;
         while(_loc3_ < param2)
         {
            if(_loc3_ == param2 - 1)
            {
               _loc6_ = param1 + "";
            }
            else
            {
               _loc6_ = "" + param1 % _loc5_[_loc3_];
               param1 /= _loc5_[_loc3_];
            }
            if(_loc6_.length < 2 && _loc3_ < 2)
            {
               _loc6_ = "0" + _loc6_;
            }
            _loc4_ = _loc6_ + ":" + _loc4_;
            _loc3_++;
         }
         return _loc4_.substring(0,_loc4_.length - 1);
      }
      
      private function resizeRootContainerToDesktop(param1:class_3134 = null) : void
      {
         var_1996.width = var_1996.desktop.width;
         var_1996.height = var_1996.desktop.height;
      }
      
      override public function get mainWindow() : class_3127
      {
         return var_1996;
      }
      
      override public function dispose() : void
      {
         if(_bubble != null)
         {
            destroyWindow();
         }
         var_1996.removeEventListener("WE_PARENT_RESIZED",resizeRootContainerToDesktop);
         var_1996.dispose();
         super.dispose();
      }
      
      public function open(param1:int, param2:int, param3:class_1663) : void
      {
         var _loc4_:String = null;
         var _loc11_:String = null;
         var _loc7_:class_3151 = null;
         var _loc6_:String = null;
         if(_bubble != null)
         {
            destroyWindow();
         }
         var _loc8_:* = false;
         if(param3.clearType != -1 && param3.scoreType != -1)
         {
            _loc8_ = SCORETYPE_LOCALIZATION_KEY_POSTFIX[param3.scoreType].indexOf("time") >= 0;
            _loc4_ = String(class_3331(var_1453).container.localization.getLocalization("high.score.display.cleartype.undefined"));
            _loc11_ = String(class_3331(var_1453).container.localization.getLocalization("high.score.display.scoretype.undefined"));
            class_3331(var_1453).container.localization.registerParameter("high.score.display.caption","cleartype",_loc4_);
            class_3331(var_1453).container.localization.registerParameter("high.score.display.caption","scoretype",_loc11_);
         }
         var_354 = param2;
         var_3287 = param1;
         createWindow();
         if(!var_3301)
         {
            class_14.log("ERROR: \'entry_template\' could not found from high score display\'s window XML");
            return;
         }
         var _loc9_:ITextWindow;
         (_loc9_ = ITextWindow(_bubble.findChildByName("score_header"))).caption = class_3331(var_1453).container.localization.getLocalization(_loc8_ ? "high.score.display.time.header" : "high.score.display.score.header");
         _loc9_.invalidate();
         var _loc10_:IItemListWindow = IItemListWindow(_bubble.findChildByName("entries"));
         for each(var _loc5_ in param3.entries)
         {
            (_loc7_ = class_3151(var_3301.clone())).getChildByName("usernames").caption = getUserNameList(_loc5_.users);
            _loc6_ = _loc8_ ? (_loc5_.score >= 3600 ? scoreToTime(_loc5_.score,3) : scoreToTime(_loc5_.score,2)) : _loc5_.score.toString();
            _loc7_.getChildByName("score").caption = _loc6_;
            _loc10_.addListItem(_loc7_);
         }
         _loc10_.invalidate();
      }
      
      private function getUserNameList(param1:Array) : String
      {
         var _loc2_:String = "";
         for each(var _loc3_ in param1)
         {
            _loc2_ = _loc2_ + _loc3_ + ", ";
         }
         return _loc2_.substr(0,_loc2_.length - 2);
      }
      
      public function setRelativePositionToRoomObjectAt(param1:int, param2:int) : void
      {
         if(!_bubble)
         {
            return;
         }
         _bubble.x = param1 + -138;
         _bubble.y = param2 + -400;
      }
      
      private function createWindow() : void
      {
         var _loc1_:class_3349 = class_3349(windowManager.buildFromXML(XML(assets.getAssetByName("high_score_display_xml").content)));
         var_3301 = class_3151(_loc1_.findChildByName("entry_template"));
         IItemListWindow(_loc1_.findChildByName("entries")).removeListItem(var_3301);
         _bubble = _loc1_;
         _bubble.x = _lastPosition.x;
         _bubble.y = _lastPosition.y;
         var_1996.addChild(_loc1_);
      }
      
      private function destroyWindow() : void
      {
         var_1996.removeChild(_bubble);
         _lastPosition.x = _bubble.x;
         _lastPosition.y = _bubble.y;
         _bubble.dispose();
         _bubble = null;
         var_354 = -1;
         var_3287 = -1;
      }
      
      public function get isOpen() : Boolean
      {
         return _bubble != null && false;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function get roomObjId() : int
      {
         return var_3287;
      }
      
      public function close() : void
      {
         destroyWindow();
      }
   }
}
