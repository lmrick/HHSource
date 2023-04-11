package com.sulake.habbo.ui.widget.furniture.trophy
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextLinkWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   
   public class NikoTrophyView implements ITrophyView
   {
       
      
      private var var_3592:int;
      
      private var var_1429:com.sulake.habbo.ui.widget.furniture.trophy.TrophyFurniWidget;
      
      private var _window:class_3151;
      
      public function NikoTrophyView(param1:com.sulake.habbo.ui.widget.furniture.trophy.TrophyFurniWidget, param2:int)
      {
         super();
         var_1429 = param1;
         var_3592 = param2;
      }
      
      public function dispose() : void
      {
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         var_1429 = null;
      }
      
      public function showInterface() : Boolean
      {
         var _loc2_:class_3127 = null;
         var _loc4_:ITextWindow = null;
         var _loc6_:ITextLinkWindow = null;
         var _loc3_:ITextWindow = null;
         var _loc7_:IStaticBitmapWrapperWindow = null;
         var _loc8_:IAsset = var_1429.assets.getAssetByName("niko_trophy");
         var _loc1_:XmlAsset = XmlAsset(_loc8_);
         if(_loc1_ == null)
         {
            return false;
         }
         if(_window == null)
         {
            _window = var_1429.windowManager.buildFromXML(_loc1_.content as XML) as class_3151;
         }
         _window.center();
         _loc2_ = _window.findChildByName("header_button_close");
         if(_loc2_ != null)
         {
            _loc2_.addEventListener("WME_CLICK",onCloseElem);
         }
         if((_loc4_ = _window.findChildByName("html_textbox") as ITextWindow) != null)
         {
            switch(var_3592 - 10)
            {
               case 0:
                  _loc4_.text = var_1429.localizations.getLocalization("niko.trophy.description.silver");
                  break;
               case 10:
                  _loc4_.text = var_1429.localizations.getLocalization("niko.trophy.description.gold");
            }
         }
         if((_loc6_ = _window.findChildByName("store_link") as ITextLinkWindow) != null)
         {
            _loc6_.addEventListener("WME_CLICK",onAppstoreLink);
         }
         _loc3_ = _window.findChildByName("date") as ITextWindow;
         if(_loc3_ != null)
         {
            var_1429.localizations.registerParameter("trophy.niko.date","date",var_1429.date);
            _loc3_.text = var_1429.localizations.getLocalization("trophy.niko.date");
         }
         if((_loc7_ = _window.findChildByName("preview_image") as IStaticBitmapWrapperWindow) != null)
         {
            if(var_3592 == 20)
            {
               _loc7_.assetUri = "${image.library.url}niko/niko_trophy_gold.png";
            }
            else
            {
               _loc7_.assetUri = "${image.library.url}niko/niko_trophy_silver.png";
            }
         }
         if((_loc7_ = _window.findChildByName("store_image") as IStaticBitmapWrapperWindow) != null)
         {
            _loc7_.assetUri = "${image.library.url}niko/" + var_1429.configuration.getProperty("niko.trophy.appstore.image") + ".png";
         }
         var _loc9_:IRegionWindow;
         if(_loc9_ = _window.findChildByName("appstore_region") as IRegionWindow)
         {
            _loc9_.addEventListener("WME_CLICK",onAppstoreLink);
         }
         return true;
      }
      
      public function disposeInterface() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      private function onAppstoreLink(param1:WindowMouseEvent) : void
      {
         var _loc2_:String = String(var_1429.configuration.getProperty("niko.appstore.link.url"));
         HabboWebTools.openWebPage(_loc2_,"habboMain");
      }
      
      private function onCloseElem(param1:WindowMouseEvent) : void
      {
         disposeInterface();
      }
   }
}
