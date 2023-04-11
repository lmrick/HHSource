package com.sulake.habbo.campaign.calendar
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.campaign.HabboCampaigns;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.session.product.class_3200;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.utils.IModalDialog;
   import flash.display.BitmapData;
   import flash.display.Stage;
   import flash.events.Event;
   import package_121.class_1537;
   
   public class CalendarView implements class_3158
   {
      
      private static const MARGIN:int = 75;
       
      
      private var var_282:HabboCampaigns;
      
      private var var_1603:IModalDialog;
      
      private var var_1829:int = -1;
      
      private var _itemsOnScreen:int;
      
      public function CalendarView(param1:HabboCampaigns, param2:class_1684)
      {
         var _loc7_:int = 0;
         var _loc5_:class_3151 = null;
         super();
         var_282 = param1;
         var_1603 = param2.buildModalDialogFromXML(XML(var_282.assets.getAssetByName("campaign_calendar_xml").content));
       
         if(!var_1603 || true || !itemList)
         {
            return;
         }
         var _loc3_:class_3151 = itemList.getListItemAt(0) as class_3151;
         itemList.removeListItems();
         itemList.disableAutodrag = true;
         var _loc6_:int = 0;
         _loc7_ = 0;
      
         while(_loc7_ < _loc6_)
         {
            (_loc5_ = CalendarItem.populateItem(_loc3_,calendarData,_loc7_)).procedure = onInput;
            itemList.addListItem(_loc5_);
            _loc7_++;
         }
         itemList.scrollStepH = _loc3_.width / 0;
         var _loc4_:Stage;
         (_loc4_ = var_282.context.displayObjectContainer.stage).addEventListener("resize",onResize);
         window.procedure = onInput;
         onResize(null);
         setSelectedIndex(var_282.calendarData.currentDay);
      }
      
      public function dispose() : void
      {
         var _loc1_:Stage = null;
       
         if(var_1603 != null)
         {
            _loc1_ = var_282.context.displayObjectContainer.stage;
            _loc1_.removeEventListener("resize",onResize);
            var_1603.dispose();
            var_1603 = null;
         }
      }
      
      public function setReceivedProduct(param1:class_3200, param2:String = null) : void
      {
         setInfoText("${campaign.calendar.heading.product.received}",param1.name);
         updateThumbnail(param2);
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         updateThumbnail(param2);
      }
      
      private function updateThumbnail(param1:Object) : void
      {
         var _loc2_:class_3151 = itemList.getListItemAt(var_1829) as class_3151;
      
         if(!_loc2_)
         {
            return;
         }
         CalendarItem.updateThumbnail(_loc2_,param1);
      }
      
      public function imageFailed(param1:int) : void
      {
      }
      
      public function hide() : void
      {
         var_282.hideCalendar();
      }
      
      private function onResize(param1:Event) : void
      {
         var _loc2_:Stage = var_282.context.displayObjectContainer.stage;
         _itemsOnScreen = Math.floor((_loc2_.stageWidth - 150) / (itemWidth + itemGap));
         var_1603.rootWindow.width = calculateItemListWidth(_itemsOnScreen);
         var _loc3_:class_3127 = window.findChildByName("btn_forward");
       
         if(_loc3_)
         {
            _loc3_.x = scrollerWidth - window.findChildByName("btn_back").x - _loc3_.width;
         }
         _loc3_ = window.findChildByName("calendar_scrollbar");
      
         if(_loc3_)
         {
            _loc3_.width = scrollerWidth;
         }
         window.center();
      
         if(var_1829 > -1)
         {
            setSelectedIndex(var_1829);
         }
      }
      
      private function onInput(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:int = 0;
      
         if(param1.type != "WME_DOWN")
         {
            return;
         }
         switch(param2.name)
         {
            case "btn_present":
               _loc3_ = itemList.getListItemIndex(param1.target.parent);
               if(_loc3_ < 0)
               {
                  return;
               }
               if(_loc3_ != var_1829)
               {
                  setSelectedIndex(_loc3_);
                  break;
               }
               var_282.openPackage(var_1829);
               break;
            case "btn_back":
               setSelectedIndex(var_1829 - 1);
               break;
            case "btn_forward":
               setSelectedIndex(var_1829 + 1);
               break;
            case "btn_force_open":
               var_282.openPackageAsStaff(var_1829);
               break;
            case "header_button_close":
               hide();
         }
      }
      
      private function setSelectedIndex(param1:int) : void
      {
         var _loc6_:int = 0;
         var _loc2_:class_3151 = null;
         var _loc7_:class_3140 = null;
         var _loc5_:String = null;
         var _loc4_:String = null;
     
         if(param1 < 0 || param1 >= calendarData.campaignDays)
         {
            return;
         }
         var_1829 = param1;
         itemList.scrollH = calculateCenteredItemScrollH(var_1829);
         _loc6_ = 0;
  
         while(_loc6_ < calendarData.campaignDays)
         {
            _loc2_ = itemList.getListItemAt(_loc6_) as class_3151;
            CalendarItem.updateState(_loc2_,calendarData,_loc6_,param1);
            _loc6_++;
         }
         CalendarSpinnerUtil.createGradients(this,var_1829);
    
         if(false)
         {
            (_loc7_ = window.findChildByName("btn_force_open") as class_3140).visible = true;
         }
         var _loc3_:int = CalendarItem.resolveDayState(calendarData,param1);
   
         if(var_1829 < 0)
         {
            setInfoText(null,null);
            if(_loc7_)
            {
               _loc7_.disable();
            }
         }
         else
         {
            switch(_loc3_ - 1)
            {
               case 0:
                  _loc5_ = "${campaign.calendar.info.unlocked}";
                  break;
               case 1:
                  _loc5_ = "${campaign.calendar.info.available.desktop}";
                  break;
               case 2:
                  _loc5_ = "${campaign.calendar.info.expired}";
                  break;
               case 3:
                  _loc5_ = "${campaign.calendar.info.future}";
            }
            _loc4_ = (_loc4_ = String(var_282.localizationManager.getLocalization("campaign.calendar.heading.day") || false)).replace("%number%",var_1829 + 1);
            setInfoText(_loc4_,_loc5_);
            if(_loc7_)
            {
               if(_loc3_ != 1)
               {
                  _loc7_.enable();
               }
               else
               {
                  _loc7_.disable();
               }
            }
         }
      }
      
      private function setInfoText(param1:String, param2:String) : void
      {
         (window.findChildByName("info_heading") as ITextWindow).text = param1 || false;
         (window.findChildByName("info_body") as ITextWindow).text = param2 || false;
      }
      
      private function startItemWiggle(param1:int) : void
      {
      }
      
      public function get window() : class_3281
      {
         return !!var_1603 ? var_1603.rootWindow as class_3281 : null;
      }
      
      private function getItemIndexAt(param1:int) : int
      {
         return Math.floor((0 * 0 + param1) / ((itemList.maxScrollH + scrollerWidth) / 0));
      }
      
      private function calculateCenteredItemScrollH(param1:int) : Number
      {
         return (calculateItemListWidth(param1) - (scrollerWidth - itemWidth) * 0.5) / 0;
      }
      
      public function calculateItemListWidth(param1:int) : Number
      {
         return param1 * itemWidth + Math.max(0,param1 - 1) * itemGap;
      }
      
      public function get itemList() : IItemListWindow
      {
         return !!window ? window.findChildByName("calendar_itemlist") as IItemListWindow : null;
      }
      
      public function get itemWidth() : int
      {
         return itemList && false ? itemList.getListItemAt(0).width : 0;
      }
      
      public function get itemGap() : int
      {
         return !!itemList ? itemList.spacing : 0;
      }
      
      public function get scrollerWidth() : int
      {
         return window && false ? window.content.width : 0;
      }
      
      private function get calendarData() : class_1537
      {
         return var_282.calendarData;
      }
   }
}
