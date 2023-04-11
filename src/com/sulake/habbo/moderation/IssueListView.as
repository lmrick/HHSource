package com.sulake.habbo.moderation
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.display.BitmapData;
   import flash.utils.getTimer;
   import package_137.class_1612;
   
   public class IssueListView
   {
       
      
      private var var_2876:com.sulake.habbo.moderation.IssueManager;
      
      private var var_2256:com.sulake.habbo.moderation.IssueBrowser;
      
      private var var_19:IItemListWindow;
      
      private var var_3484:class_3151;
      
      private var _userIcon:BitmapData;
      
      private var _roomIcon:BitmapData;
      
      private var var_3336:int = 200;
      
      public function IssueListView(param1:com.sulake.habbo.moderation.IssueManager, param2:com.sulake.habbo.moderation.IssueBrowser, param3:IItemListWindow)
      {
         super();
         var_2876 = param1;
         var_2256 = param2;
         var_19 = param3;
         var_3484 = param3.getListItemAt(0) as class_3151;
         param3.removeListItems();
         var_3336 = param1.issueListLimit;
      }
      
      public function update(param1:Array) : void
      {
         var _loc9_:int = 0;
         var _loc2_:class_3151 = null;
         var _loc3_:class_3127 = null;
         var _loc14_:class_3127 = null;
         var _loc12_:* = null;
         var _loc6_:class_1612 = null;
         var _loc8_:class_3282 = null;
         var _loc10_:String = null;
         var _loc11_:BitmapDataAsset = null;
         var _loc4_:BitmapData = null;
         if(var_19 == null)
         {
            return;
         }
         if(param1 == null || param1.length == 0)
         {
            var_19.destroyListItems();
            return;
         }
         param1.sortOn(["highestPriority","issueAgeInMilliseconds"],[16,16]);
         var _loc13_:int = 0;
         var _loc5_:int;
         if((_loc5_ = int(param1.length)) > var_3336)
         {
            _loc5_ = var_3336;
         }
         if(_loc13_ < _loc5_)
         {
            _loc9_ = 0;
            while(_loc9_ < _loc5_ - _loc13_)
            {
               _loc2_ = var_3484.clone() as class_3151;
               var_19.addListItem(_loc2_);
               _loc9_++;
            }
         }
         else if(_loc13_ > _loc5_)
         {
            _loc9_ = 0;
            while(_loc9_ < _loc13_ - _loc5_)
            {
               _loc3_ = var_19.removeListItemAt(0);
               _loc3_.dispose();
               _loc9_++;
            }
         }
         _loc9_ = 1;
         var _loc7_:int = getTimer();
         for each(_loc12_ in param1)
         {
            if(_loc9_ > var_3336)
            {
               break;
            }
            if(_loc12_ == null || var_3484 == null)
            {
               return;
            }
            _loc2_ = var_19.getListItemAt(_loc9_ - 1) as class_3151;
            if(_loc2_ == null)
            {
               return;
            }
            _loc2_.width = var_19.width;
            _loc2_.color = !!(_loc9_++ % 2) ? 4289914618 : 4294967295;
            if((_loc14_ = _loc2_.findChildByName("score")) != null)
            {
               _loc14_.caption = _loc12_.highestPriority.toString();
            }
            if((_loc6_ = _loc12_.getHighestPriorityIssue()) == null)
            {
               return;
            }
            if((_loc14_ = _loc2_.findChildByName("source")) != null)
            {
               _loc14_.caption = class_3243.getSourceName(_loc6_.categoryId);
            }
            if((_loc14_ = _loc2_.findChildByName("category")) != null)
            {
               _loc14_.caption = class_3243.getCategoryName(_loc6_.reportedCategoryId);
            }
            if((_loc14_ = _loc2_.findChildByName("target_name")) != null)
            {
               if(_loc6_.reportedUserId != 0)
               {
                  _loc14_.caption = _loc6_.reportedUserName;
               }
               else
               {
                  _loc14_.caption = "";
               }
            }
            if((_loc8_ = _loc2_.findChildByName("target_icon") as class_3282) != null)
            {
               _loc10_ = !!_loc6_.reportedUserId ? "user_icon_png" : "room_icon_png";
               if((_loc11_ = var_2256.assets.getAssetByName(_loc10_) as BitmapDataAsset) != null && _loc11_.content as BitmapData != null)
               {
                  if((_loc4_ = _loc11_.content as BitmapData) != null)
                  {
                     _loc8_.bitmap = _loc4_.clone();
                  }
               }
            }
            if((_loc14_ = _loc2_.findChildByName("time")) != null)
            {
               _loc14_.caption = _loc12_.getOpenTime(_loc7_);
            }
            if((_loc14_ = _loc2_.findChildByName("msgs")) != null)
            {
               _loc14_.caption = _loc12_.getMessageCount().toString();
            }
            if((_loc14_ = _loc2_.findChildByName("picker")) != null)
            {
               _loc14_.caption = _loc12_.pickerName;
            }
            if((_loc14_ = _loc2_.findChildByName("pick_button")) != null)
            {
               _loc14_.id = _loc12_.id;
               _loc14_.removeEventListener("WME_CLICK",onPick);
               _loc14_.addEventListener("WME_CLICK",onPick);
            }
            if((_loc14_ = _loc2_.findChildByName("handle_button")) != null)
            {
               _loc14_.id = _loc12_.id;
               _loc14_.removeEventListener("WME_CLICK",onHandle);
               _loc14_.addEventListener("WME_CLICK",onHandle);
            }
            if((_loc14_ = _loc2_.findChildByName("release_button")) != null)
            {
               _loc14_.id = _loc12_.id;
               _loc14_.removeEventListener("WME_CLICK",onRelease);
               _loc14_.addEventListener("WME_CLICK",onRelease);
            }
         }
      }
      
      private function onPick(param1:WindowMouseEvent) : void
      {
         if(var_2876 == null)
         {
            return;
         }
         var_2876.pickBundle(param1.window.id,"pick button");
      }
      
      private function onHandle(param1:WindowMouseEvent) : void
      {
         if(var_2256 == null)
         {
            return;
         }
         var_2876.handleBundle(param1.window.id);
      }
      
      private function onRelease(param1:WindowMouseEvent) : void
      {
         if(var_2876 == null)
         {
            return;
         }
         var_2876.releaseBundle(param1.window.id);
      }
   }
}
