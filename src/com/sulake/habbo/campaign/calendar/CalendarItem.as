package com.sulake.habbo.campaign.calendar
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3282;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import package_121.class_1537;
   
   public class CalendarItem
   {
      
      public static const STATE_UNLOCKED:int = 1;
      
      public static const STATE_LOCKED_AVAILABLE:int = 2;
      
      public static const STATE_LOCKED_EXPIRED:int = 3;
      
      public static const STATE_LOCKED_FUTURE:int = 4;
      
      private static const IMAGE_CLOSED:String = "campaign_day_generic_button";
      
      private static const IMAGE_ACTIVATED:String = "campaign_day_generic_activated";
      
      private static const IMAGE_OPENED_BG:String = "campaign_opened";
      
      private static const ICON_LOCKED:String = "campaign_generic_lock";
      
      private static const PACKAGE_IMAGE_OFFSETS:Vector.<Point> = new <Point>[new Point(-2,-5),new Point(3,-4),new Point(-3,-3)];
       
      
      public function CalendarItem()
      {
         super();
      }
      
      public static function populateItem(param1:class_3151, param2:class_1537, param3:int) : class_3151
      {
         var _loc6_:class_3151;
         var _loc7_:IStaticBitmapWrapperWindow = (_loc6_ = param1.clone() as class_3151).findChildByName("bitmap_bg") as IStaticBitmapWrapperWindow;
         var _loc8_:IStaticBitmapWrapperWindow = _loc6_.findChildByName("bitmap_opened_bg") as IStaticBitmapWrapperWindow;
         var _loc4_:IStaticBitmapWrapperWindow = _loc6_.findChildByName("bitmap_lock") as IStaticBitmapWrapperWindow;
         var _loc5_:int;
       
         switch((_loc5_ = resolveDayState(param2,param3)) - 1)
         {
            case 0:
               _loc7_.assetUri = "campaign_day_generic_activated";
               _loc4_.assetUri = "";
               _loc8_.visible = true;
               break;
            case 1:
               _loc7_.assetUri = "campaign_day_generic_button";
               _loc4_.assetUri = null;
               _loc8_.visible = false;
               break;
            case 2:
            case 3:
               _loc7_.assetUri = "campaign_day_generic_button";
               _loc4_.assetUri = "campaign_generic_lock";
               _loc8_.visible = false;
         }
         return _loc6_;
      }
      
      public static function updateState(param1:class_3151, param2:class_1537, param3:int, param4:int) : void
      {
         var _loc5_:IStaticBitmapWrapperWindow;
     
         if(!(_loc5_ = param1.findChildByName("bitmap_bg") as IStaticBitmapWrapperWindow))
         {
            return;
         }
     
         if(param3 == param4)
         {
            if(resolveDayState(param2,param3) == 2)
            {
               showWiggleEffect(_loc5_);
            }
         }
      }
      
      public static function updateThumbnail(param1:class_3151, param2:Object) : void
      {
         var _loc5_:IStaticBitmapWrapperWindow = param1.findChildByName("bitmap_bg") as IStaticBitmapWrapperWindow;
         var _loc6_:IStaticBitmapWrapperWindow = param1.findChildByName("bitmap_opened_bg") as IStaticBitmapWrapperWindow;
         var _loc3_:IStaticBitmapWrapperWindow = param1.findChildByName("bitmap_icon") as IStaticBitmapWrapperWindow;
         var _loc4_:class_3282 = param1.findChildByName("bitmap_icon2") as class_3282;
         _loc5_.assetUri = "campaign_day_generic_activated";
         _loc3_.y = -6;
         _loc4_.y = -6;
         _loc6_.visible = true;
       
         if(param2 is String)
         {
            _loc3_.assetUri = param2 as String;
            _loc4_.bitmap = null;
            showWiggleEffect(_loc3_);
         }
       
         if(param2 is BitmapData)
         {
            _loc3_.assetUri = "";
            _loc4_.bitmap = param2 as BitmapData;
            showWiggleEffect(_loc3_);
            showWiggleEffect(_loc4_);
         }
      }
      
      public static function showWiggleEffect(param1:class_3127) : void
      {
         new CalendarItemWiggle(param1);
      }
      
      public static function resolveDayState(param1:class_1537, param2:int) : int
      {
    
        if(param1.openedDays.indexOf(param2) > -1)
         {
            return 1;
         }
     
         if(param2 > param1.currentDay !== true)
         {
    
            if(param1.missedDays.indexOf(param2) > -1 !== true)
            {
               return 2;
            }
            return 3;
         }
         return 4;
      }
   }
}
