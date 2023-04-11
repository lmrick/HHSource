package com.sulake.habbo.ui.widget.furniture.mysterybox
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget;
   import com.sulake.habbo.window.utils.IModalDialog;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import package_107.class_569;
   import package_107.class_658;
   import package_107.class_797;
   import package_112.class_672;
   import package_13.class_560;
   import package_168.class_1324;
   
   public class MysteryBoxOpenDialogView implements class_13, class_3158
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1429:FurnitureContextMenuWidget;
      
      private var var_1680:IModalDialog;
      
      private var _window:class_3151;
      
      private var var_1795:IRoomObject;
      
      private var var_3079:class_569;
      
      private var var_3139:class_658;
      
      private var var_3046:class_797;
      
      private var var_2735:int = -1;
      
      public function MysteryBoxOpenDialogView(param1:FurnitureContextMenuWidget)
      {
         super();
         var_1429 = param1;
         var_3079 = new class_569(onShowMysteryBoxWait);
         var_3139 = new class_658(onCancelMysteryBoxWait);
         var_3046 = new class_797(onGotMysteryBoxPrize);
         connection.addMessageEvent(var_3079);
         connection.addMessageEvent(var_3139);
         connection.addMessageEvent(var_3046);
      }
      
      private function onShowMysteryBoxWait(param1:class_569) : void
      {
         showWaitWindow();
      }
      
      private function onCancelMysteryBoxWait(param1:class_658) : void
      {
         closeWindow();
      }
      
      private function onGotMysteryBoxPrize(param1:class_797) : void
      {
         var _loc2_:class_1324 = param1.getParser();
         showRewardWindow(_loc2_.contentType,_loc2_.classId);
      }
      
      private function showWaitWindow() : void
      {
         closeWindow();
         var _loc1_:XML = var_1429.assets.getAssetByName("mystery_box_open_dialog").content as XML;
         var_1680 = var_1429.handler.container.windowManager.buildModalDialogFromXML(_loc1_);
         _window = var_1680.rootWindow as class_3151;
         _window.procedure = waitWindowProcedure;
         var _loc4_:Boolean;
         var _loc5_:String = (_loc4_ = var_1429.handler.container.isOwnerOfFurniture(var_1795)) ? "mysterybox.dialog.owner." : "mysterybox.dialog.other.";
         _window.caption = "${" + _loc5_ + "title}";
         _window.findChildByName("subtitle_text").caption = "${" + _loc5_ + "subtitle}";
         _window.findChildByName("waiting_text").caption = "${" + _loc5_ + "waiting}";
         _window.findChildByName("cancel_button").caption = "${" + _loc5_ + "cancel}";
         IStaticBitmapWrapperWindow(_window.findChildByName("reward_base")).assetUri = _loc4_ ? "mysterybox_box_base" : "mysterybox_key_base";
         IStaticBitmapWrapperWindow(_window.findChildByName("reward_overlay")).assetUri = _loc4_ ? "mysterybox_box_overlay" : "mysterybox_key_overlay";
         IStaticBitmapWrapperWindow(_window.findChildByName("needed_base")).assetUri = _loc4_ ? "mysterybox_key_base" : "mysterybox_box_base";
         IStaticBitmapWrapperWindow(_window.findChildByName("needed_overlay")).assetUri = _loc4_ ? "mysterybox_key_overlay" : "mysterybox_box_overlay";
         var _loc6_:ISessionDataManager = var_1429.handler.container.sessionDataManager;
         var _loc2_:String = _loc4_ ? _loc6_.mysteryBoxColor : _loc6_.mysteryKeyColor;
         if(_loc2_ == null || _loc2_ == "")
         {
            return;
         }
         var _loc3_:uint = uint(MysteryBoxToolbarExtension.KEY_COLORS[_loc2_.toLowerCase()]);
         _window.findChildByName("reward_base").color = _loc3_;
         _window.findChildByName("needed_base").color = _loc3_;
      }
      
      private function waitWindowProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param1.target.name)
         {
            case "header_button_close":
            case "cancel_button":
               closeWindow();
               connection.send(new class_672(var_1429.handler.container.getFurnitureOwnerId(var_1795)));
         }
      }
      
      private function showRewardWindow(param1:String, param2:int) : void
      {
         closeWindow();
         var _loc3_:XML = var_1429.assets.getAssetByName("mystery_box_reward").content as XML;
         var_1680 = var_1429.handler.container.windowManager.buildModalDialogFromXML(_loc3_);
         _window = var_1680.rootWindow as class_3151;
         _window.procedure = rewardWindowProcedure;
         var_2735 = -1;
         var _loc4_:class_3266 = null;
         switch(param1)
         {
            case "s":
               _loc4_ = var_1429.handler.container.roomEngine.getFurnitureImage(param2,new Vector3d(90,0,0),64,this,0);
               break;
            case "i":
               _loc4_ = var_1429.handler.container.roomEngine.getWallItemImage(param2,new Vector3d(90,0,0),64,this,0);
               break;
            case "e":
               rewardBitmap = var_1429.handler.container.catalog.getPixelEffectIcon(param2);
               break;
            case "h":
               rewardBitmap = var_1429.handler.container.catalog.getSubscriptionProductIcon(param2);
               break;
            default:
               return;
         }
         if(_loc4_ != null)
         {
            if(_loc4_.data != null)
            {
               rewardBitmap = _loc4_.data;
            }
            var_2735 = _loc4_.id;
         }
      }
      
      private function set rewardBitmap(param1:BitmapData) : void
      {
         if(_window == null || false)
         {
            return;
         }
         var _loc3_:class_3282 = _window.findChildByName("reward_image") as class_3282;
         var _loc2_:class_3127 = _window.findChildByName("bitmap_container");
         _loc3_.bitmap = param1;
         _loc2_.width = param1.width;
         _loc2_.height = param1.height;
         _loc2_.width++;
      }
      
      private function rewardWindowProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param1.target.name)
         {
            case "header_button_close":
            case "close_button":
               closeWindow();
         }
      }
      
      private function closeWindow() : void
      {
         if(var_1680 != null && true)
         {
            _window = null;
            var_1680.dispose();
            var_1680 = null;
         }
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         closeWindow();
         connection.removeMessageEvent(var_3079);
         connection.removeMessageEvent(var_3139);
         connection.removeMessageEvent(var_3046);
         var_3079 = null;
         var_3139 = null;
         var_3046 = null;
         var_1795 = null;
         var_1429 = null;
         _disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function startOpenFlow(param1:IRoomObject) : void
      {
         var_1795 = param1;
         connection.send(new class_560(param1.getId()));
      }
      
      private function get connection() : IConnection
      {
         return var_1429.handler.container.connection;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(param1 == var_2735)
         {
            var_2735 = -1;
            rewardBitmap = param2;
         }
      }
      
      public function imageFailed(param1:int) : void
      {
      }
   }
}
