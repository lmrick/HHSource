package com.sulake.habbo.notifications.singular
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.window.class_1684;
   
   public class MOTDNotification
   {
       
      
      private var _window:class_3281;
      
      private var var_44:class_18;
      
      private var var_628:Array;
      
      private const LIST_ITEM_HEIGHT_MARGIN:int = 20;
      
      public function MOTDNotification(param1:Array, param2:class_21, param3:class_1684)
      {
         var _loc9_:* = null;
         var _loc8_:class_3151 = null;
         var _loc7_:ITextWindow = null;
         super();
         if(!param3 || !param2)
         {
            return;
         }
         var_628 = param1;
         var _loc6_:XmlAsset;
         if((_loc6_ = param2.getAssetByName("motd_notification_xml") as XmlAsset) == null)
         {
            return;
         }
         _window = param3.buildFromXML(_loc6_.content as XML) as class_3281;
         if(_window == null)
         {
            return;
         }
         _window.procedure = eventHandler;
         _window.center();
         var _loc5_:XmlAsset;
         if((_loc5_ = param2.getAssetByName("motd_notification_item_xml") as XmlAsset) == null)
         {
            return;
         }
         var _loc4_:class_3151 = param3.buildFromXML(_loc5_.content as XML) as class_3151;
         var _loc10_:IItemListWindow = _window.findChildByName("message_list") as IItemListWindow;
         for each(_loc9_ in var_628)
         {
            (_loc7_ = (_loc8_ = _loc4_.clone() as class_3151).findChildByName("message_text") as ITextWindow).text = _loc9_;
            _loc8_.height = _loc7_.textHeight + 20;
            _loc10_.addListItem(_loc8_);
         }
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         var_44 = null;
      }
      
      private function eventHandler(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "close":
            case "header_button_close":
               break;
            default:
               return;
         }
         dispose();
      }
   }
}
