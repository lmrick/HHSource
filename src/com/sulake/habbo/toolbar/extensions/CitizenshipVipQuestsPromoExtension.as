package com.sulake.habbo.toolbar.extensions
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.localization.class_17;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.components.class_3213;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.HabboToolbar;
   import com.sulake.habbo.toolbar.IExtensionView;
   import com.sulake.habbo.window.class_1684;
   import flash.events.IEventDispatcher;
   import package_52.class_707;
   import package_68.class_250;
   
   public class CitizenshipVipQuestsPromoExtension
   {
       
      
      private var _windowManager:class_1684;
      
      private var _assets:class_21;
      
      private var name_1:IEventDispatcher;
      
      private var _localization:class_17;
      
      private var _connection:IConnection;
      
      private var var_1693:IExtensionView;
      
      private var var_1430:class_3213;
      
      private var _disposed:Boolean = false;
      
      private var _expanded:Boolean = true;
      
      private var var_4135:int = 216;
      
      private var _vipQuestsCampaignName:String;
      
      private var var_2840:IMessageEvent = null;
      
      public function CitizenshipVipQuestsPromoExtension(param1:HabboToolbar, param2:class_1684, param3:class_21, param4:IEventDispatcher, param5:class_17, param6:IConnection)
      {
         super();
         _windowManager = param2;
         _assets = param3;
         name_1 = param4;
         _localization = param5;
         _connection = param6;
         var_1693 = param1.extensionView;
         var_2840 = new class_250(onCitizenshipQuestPromoEnabled);
         _connection.addMessageEvent(var_2840);
         _vipQuestsCampaignName = param1.getProperty("citizenship.vip.tutorial.quest.campaign.name");
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         if(_connection && var_2840)
         {
            _connection.removeMessageEvent(var_2840);
            var_2840 = null;
         }
         destroyWindow();
         _localization = null;
         _assets = null;
         name_1 = null;
         _windowManager = null;
         _connection = null;
         var_1693 = null;
         _disposed = true;
      }
      
      private function createWindow() : class_3213
      {
         var _loc1_:class_3213 = null;
         var _loc2_:IAsset = _assets.getAssetByName("vip_quests_promo_xml");
         if(_loc2_)
         {
            _loc1_ = _windowManager.buildFromXML(_loc2_.content as XML,1) as class_3213;
            if(_loc1_)
            {
               class_3140(_loc1_.findChildByName("quests_button").addEventListener("WME_CLICK",onButtonClicked));
               IRegionWindow(_loc1_.findChildByName("minimize_region")).addEventListener("WME_CLICK",onMinMax);
               IRegionWindow(_loc1_.findChildByName("maximize_region")).addEventListener("WME_CLICK",onMinMax);
               var_4135 = _loc1_.height;
            }
         }
         return _loc1_;
      }
      
      private function destroyWindow() : void
      {
         if(var_1693)
         {
            var_1693.detachExtension("vip_quests");
         }
         if(var_1430)
         {
            var_1430.dispose();
            var_1430 = null;
         }
      }
      
      private function onButtonClicked(param1:WindowMouseEvent) : void
      {
         if(_connection)
         {
            _connection.send(new class_707(_vipQuestsCampaignName));
         }
         destroyWindow();
      }
      
      private function onMinMax(param1:WindowMouseEvent) : void
      {
         _expanded = !_expanded;
         assignState();
      }
      
      private function assignState() : void
      {
         IItemListWindow(var_1430.findChildByName("content_itemlist")).visible = _expanded;
         IStaticBitmapWrapperWindow(var_1430.findChildByName("promo_img")).visible = _expanded;
         var_1430.height = _expanded ? var_4135 : 33;
      }
      
      private function onCitizenshipQuestPromoEnabled(param1:IMessageEvent) : void
      {
         if(var_1430 == null)
         {
            var_1430 = createWindow();
         }
         assignState();
         var_1693.detachExtension("club_promo");
         var_1693.attachExtension("vip_quests",var_1430,10);
      }
   }
}
