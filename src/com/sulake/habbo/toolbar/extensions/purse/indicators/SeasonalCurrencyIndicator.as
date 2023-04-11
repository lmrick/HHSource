package com.sulake.habbo.toolbar.extensions.purse.indicators
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.localization.class_17;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.purse.PurseEvent;
   import com.sulake.habbo.catalog.purse.class_3244;
   import com.sulake.habbo.toolbar.HabboToolbar;
   import com.sulake.habbo.toolbar.extensions.purse.CurrencyIndicatorBase;
   import com.sulake.habbo.window.class_1684;
   import flash.events.IEventDispatcher;
   
   public class SeasonalCurrencyIndicator extends CurrencyIndicatorBase
   {
      
      private static const BG_COLOR_LIGHT:uint = 4286084205;
      
      private static const BG_COLOR_DARK:uint = 4283781966;
      
      private static const ICON_ANIMATION:Array = ["toolbar_credit_icon_0","toolbar_credit_icon_1","toolbar_credit_icon_2","toolbar_credit_icon_1","toolbar_credit_icon_0"];
       
      
      private var _catalog:IHabboCatalog;
      
      private var var_1170:int = -1;
      
      private var _toolbar:HabboToolbar;
      
      public function SeasonalCurrencyIndicator(param1:HabboToolbar, param2:class_1684, param3:class_21, param4:IHabboCatalog, param5:class_17)
      {
         super(param2,param3);
         _toolbar = param1;
         _catalog = param4;
         this.bgColorLight = 4286084205;
         this.bgColorDark = 4283781966;
         this.textElementName = "amount";
         this.amountZeroText = param5.getLocalization("purse.snowflakes.zero.amount.text","Info");
         createWindow("purse_indicator_seasonal_xml",null);
         window.findChildByName("seasonal_icon").style = class_3244.getIconStyleFor(getDisplayedActivityPointType(),param1,true);
         setAmount(0);
         param1.extensionView.attachExtension("purse_seasonal_currency",window,5);
         registerUpdateEvents(param4.events);
      }
      
      private function getDisplayedActivityPointType() : int
      {
         return _toolbar.getInteger("seasonalcurrencyindicator.currency",1);
      }
      
      private function getCatalogPageName() : String
      {
         return _toolbar.getProperty("seasonalcurrencyindicator.page");
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener("catalog_purse_activity_point_balance",onBalance);
      }
      
      override protected function onContainerClick(param1:WindowMouseEvent) : void
      {
         _catalog.openCatalogPage(getCatalogPageName());
      }
      
      public function onBalance(param1:PurseEvent) : void
      {
         if(param1.activityPointType == getDisplayedActivityPointType())
         {
            setAmount(param1.balance);
            if(var_1170 != -1)
            {
               animateChange(var_1170,param1.balance);
            }
            var_1170 = param1.balance;
         }
      }
      
      override protected function setAmount(param1:int, param2:int = -1) : void
      {
         var _loc3_:String = param1.toString();
         if(param1 == 0)
         {
            _loc3_ = this.amountZeroText;
            setTextUnderline(true);
         }
         else
         {
            setTextUnderline(false);
         }
         setText(_loc3_);
      }
   }
}
