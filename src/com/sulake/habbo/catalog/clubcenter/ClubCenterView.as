package com.sulake.habbo.catalog.clubcenter
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.avatar.class_3156;
   import com.sulake.habbo.catalog.purse.class_3160;
   import com.sulake.habbo.utils.FriendlyTime;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.widgets.IRoomPreviewerWidget;
   import flash.display.BitmapData;
   import package_5.class_1628;
   
   public class ClubCenterView implements class_1870
   {
       
      
      private var var_282:com.sulake.habbo.catalog.clubcenter.HabboClubCenter;
      
      private var _window:class_3151;
      
      private var var_1429:IRoomPreviewerWidget;
      
      private var var_427:String;
      
      public function ClubCenterView(param1:com.sulake.habbo.catalog.clubcenter.HabboClubCenter, param2:class_1684, param3:String)
      {
         super();
         var_282 = param1;
         _window = param2.buildFromXML(XML(var_282.assets.getAssetByName("club_center_xml").content)) as class_3151;
         if(!container)
         {
            return;
         }
         if(!var_282.isKickbackEnabled())
         {
            removeElement("special_breakdown_link");
            removeElement("special_content");
            removeElement("special_content_postit");
            container.invalidate();
         }
         else
         {
            setElementVisibility("special_amount_icon",false);
            setElementVisibility("special_amount_title",false);
            setElementVisibility("special_amount_content",false);
            setElementVisibility("special_breakdown_link",false);
            setElementVisibility("special_time_content",false);
         }
         setElementVisibility("btn_earn",false);
         var_282.getOffers();
         _window.center();
         _window.addEventListener("WE_RELOCATE",onRelocate);
         var_427 = param3;
         var_1429 = class_3217(_window.findChildByName("avatar")).widget as IRoomPreviewerWidget;
         var _loc4_:class_3156;
         if(_loc4_ = var_282.avatarRenderManager.createAvatarImage(param3,"h",null,this))
         {
            _loc4_.setDirection("full",4);
            var_1429.showPreview(_loc4_.getCroppedImage("full"));
         }
         container.procedure = onInput;
      }
      
      public function dispose() : void
      {
         if(_window)
         {
            _window.removeEventListener("WE_RELOCATE",onRelocate);
            _window.dispose();
            _window = null;
         }
         var_282 = null;
      }
      
      public function dataReceived(param1:class_1628, param2:class_3160, param3:int, param4:BitmapData) : void
      {
         var _loc7_:int = 0;
         var _loc6_:class_3140 = null;
         var _loc9_:String = var_282.resolveClubStatus();
         setElementText("status_title","${hccenter.status." + _loc9_ + "}");
         if(!param1 || !param2)
         {
            setElementVisibility("gift_content",false);
            setElementVisibility("special_container",false);
            return;
         }
         setElementVisibility("gift_content",true);
         var _loc5_:String = (_loc5_ = (_loc5_ = (_loc5_ = getLocalization("hccenter.status." + _loc9_ + ".info")).replace("%timeleft%",formatMinutes(param2.minutesUntilExpiration))).replace("%joindate%",param1.firstSubscriptionDate)).replace("%streakduration%",formatDays(param1.currentHcStreak));
         setElementText("status_info",_loc5_);
         var _loc8_:class_3282;
         if((_loc8_ = container.findChildByName("hc_badge") as class_3282) && param4)
         {
            _loc8_.bitmap = param4;
         }
         if(var_282.isKickbackEnabled())
         {
            if(param1.timeUntilPayday < 60)
            {
               setElementText("special_time_content",getLocalization("hccenter.special.time.soon"));
            }
            else
            {
               setElementText("special_time_content",formatMinutes(param1.timeUntilPayday));
            }
            setElementVisibility("special_time_content",true);
            if((_loc7_ = param1.creditRewardForMonthlySpent + param1.creditRewardForStreakBonus) > 0)
            {
               setElementVisibility("special_amount_icon",true);
               setElementVisibility("special_amount_title",true);
               setElementVisibility("special_amount_content",true);
               setElementVisibility("special_breakdown_link",true);
               setElementText("special_amount_content",getLocalization("hccenter.special.sum").replace("%credits%",_loc7_));
            }
         }
         _loc6_ = container.findChildByName("btn_gift") as class_3140;
         if(_loc9_ == "active" && param3 > 0)
         {
            if(_loc6_)
            {
               _loc6_.caption = "${hccenter.btn.gifts.redeem}";
            }
            setElementText("gift_info",getLocalization("hccenter.unclaimedgifts").replace("%unclaimedgifts%",param3));
         }
         else
         {
            if(_loc6_)
            {
               _loc6_.caption = "${hccenter.btn.gifts.view}";
            }
            setElementText("gift_info",getLocalization("hccenter.gift.info"));
         }
         _loc6_ = container.findChildByName("btn_buy") as class_3140;
         if(_loc9_ == "active")
         {
            if(_loc6_)
            {
               _loc6_.caption = "${hccenter.btn.extend}";
            }
         }
         else if(_loc6_)
         {
            _loc6_.caption = "${hccenter.btn.buy}";
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc2_:class_3156 = null;
         if(param1 == var_427)
         {
            _loc2_ = var_282.avatarRenderManager.createAvatarImage(var_427,"h",null,this);
            _loc2_.setDirection("full",4);
            var_1429.showPreview(_loc2_.getCroppedImage("full"));
         }
      }
      
      private function onInput(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_DOWN" || !var_282)
         {
            return;
         }
         param1.stopImmediatePropagation();
         param1.stopPropagation();
         switch(param2.name)
         {
            case "header_button_close":
               var_282.removeView();
               return;
            case "special_infolink":
               var_282.openPaydayHelpPage();
               break;
            case "special_breakdown_link":
               var_282.showPaydayBreakdownView();
               break;
            case "general_infolink":
               var_282.openHelpPage();
               break;
            case "btn_gift":
               var_282.openClubGiftPage();
               var_282.removeView();
               break;
            case "btn_buy":
               var_282.openPurchasePage();
               var_282.removeView();
               break;
            case "btn_earn":
               if(false)
               {
                  var_282.offerCenter.showVideo();
                  break;
               }
               break;
            default:
               return;
         }
      }
      
      private function onRelocate(param1:class_3134) : void
      {
         var_282.removeBreakdown();
      }
      
      private function get container() : class_3151
      {
         return _window;
      }
      
      private function setElementText(param1:String, param2:String) : void
      {
         if(!container)
         {
            return;
         }
         var _loc3_:ITextWindow = container.findChildByName(param1) as ITextWindow;
         if(_loc3_)
         {
            _loc3_.text = param2;
         }
      }
      
      private function setElementVisibility(param1:String, param2:Boolean) : void
      {
         if(!container)
         {
            return;
         }
         var _loc3_:class_3127 = container.findChildByName(param1);
         if(_loc3_)
         {
            _loc3_.visible = param2;
         }
      }
      
      public function getSpecialCalloutAnchor() : class_3127
      {
         return !!container ? container.findChildByName("special_content_postit") : null;
      }
      
      private function removeElement(param1:*) : void
      {
         if(!container)
         {
            return;
         }
         var _loc3_:class_3127 = container.findChildByName(param1);
         if(!_loc3_)
         {
            return;
         }
         var _loc2_:class_3151 = _loc3_.parent as class_3151;
         _loc2_.removeChild(_loc3_);
      }
      
      private function getLocalization(param1:String) : String
      {
         if(!var_282 || true)
         {
            return "";
         }
         return var_282.localization.getLocalization(param1,param1);
      }
      
      public function formatMinutes(param1:int) : String
      {
         return FriendlyTime.getShortFriendlyTime(var_282.localization,param1 * 60);
      }
      
      public function formatDays(param1:int) : String
      {
         return FriendlyTime.getShortFriendlyTime(var_282.localization,param1 * 86400);
      }
      
      public function get disposed() : Boolean
      {
         return var_282 == null;
      }
      
      public function setVideoOfferButtonVisibility(param1:Boolean, param2:Boolean) : void
      {
         var _loc3_:class_3127 = _window.findChildByName("btn_earn");
         if(_loc3_)
         {
            _loc3_.visible = param1;
            if(param2)
            {
               _loc3_.enable();
               _loc3_.alpha = 0;
            }
            else
            {
               _loc3_.disable();
               _loc3_.alpha = 51;
            }
         }
      }
   }
}
