package com.sulake.habbo.nux
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.events.ILinkEventTracker;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.navigator.class_1685;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.utils.class_3216;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboNavigator;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import package_162.class_1141;
   import package_43.class_1156;
   import package_43.class_188;
   import package_45.class_437;
   import package_49.class_898;
   import package_74.class_1604;
   import package_74.class_287;
   import package_74.class_657;
   
   public class HabboNuxDialogs extends class_20 implements ILinkEventTracker
   {
       
      
      protected var _communicationManager:class_25;
      
      protected var _navigator:class_1685;
      
      protected var _windowManager:class_1684;
      
      protected var _localizationManager:class_18;
      
      protected var _catalog:IHabboCatalog;
      
      protected var _sessionDataManager:ISessionDataManager;
      
      protected var _roomSessionManager:IRoomSessionManager;
      
      private var _connection:IConnection;
      
      private var var_2946:com.sulake.habbo.nux.NuxOfferOldUserView;
      
      private var var_2912:com.sulake.habbo.nux.NuxGiftSelectionView;
      
      private var var_2942:com.sulake.habbo.nux.NuxNoobRoomOfferView;
      
      private var var_2500:Timer;
      
      public function HabboNuxDialogs(param1:class_31, param2:uint, param3:class_21)
      {
         super(param1,param2,param3);
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communicationManager = param1;
         },true),new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         }),new ComponentDependency(new IIDHabboNavigator(),function(param1:class_1685):void
         {
            _navigator = param1;
         }),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localizationManager = param1;
         }),new ComponentDependency(new IIDHabboCatalog(),function(param1:IHabboCatalog):void
         {
            _catalog = param1;
         }),new ComponentDependency(new IIDSessionDataManager(),function(param1:ISessionDataManager):void
         {
            _sessionDataManager = param1;
         }),new ComponentDependency(new IIDHabboRoomSessionManager(),function(param1:IRoomSessionManager):void
         {
            _roomSessionManager = param1;
         },false,[{
            "type":"RSE_STARTED",
            "callback":onRoomSessionEvent
         },{
            "type":"RSE_ENDED",
            "callback":onRoomSessionEvent
         }])]);
      }
      
      override public function dispose() : void
      {
         context.removeLinkEventTracker(this);
         if(_windowManager)
         {
            _windowManager = null;
         }
         destroyGiftSelectionView();
         destroyNoobRoomOfferView();
         destroyNuxOfferView();
         super.dispose();
      }
      
      override protected function initComponent() : void
      {
         _connection = _communicationManager.connection;
         if(_connection)
         {
            _connection.addMessageEvent(new class_287(onNewUserExperienceNotCompleteMessage));
            _connection.addMessageEvent(new class_657(onNewUserExperienceGiftOfferMessage));
         }
         context.addLinkEventTracker(this);
      }
      
      public function get linkPattern() : String
      {
         return "nux/";
      }
      
      public function linkReceived(param1:String) : void
      {
         var _loc2_:Array = param1.split("/");
         if(_loc2_.length < 2)
         {
            return;
         }
         var _loc3_:* = _loc2_[1];
         if("lobbyoffer" !== _loc3_)
         {
            class_14.log("HabboNuxDialogs unknown link-type received: " + _loc2_[1]);
         }
         else if(_loc2_.length > 2 && _loc2_[2] == "show")
         {
            createNoobRoomOfferView();
         }
         else
         {
            destroyNoobRoomOfferView();
         }
      }
      
      public function onVerify() : void
      {
         _connection.send(new class_437(0));
      }
      
      public function onReject() : void
      {
         _windowManager.confirm("${phone.number.never.again.confirm.title}","${phone.number.never.again.confirm.text}",0,onNeverAgainConfirmClose);
      }
      
      private function onNeverAgainConfirmClose(param1:class_3216, param2:class_3134) : void
      {
         param1.dispose();
         if(param2.type == "WE_OK" && _connection)
         {
            destroyNuxOfferView();
            _connection.send(new class_437(2));
         }
      }
      
      public function onSendGetGifts(param1:Vector.<class_1156>) : void
      {
         destroyGiftSelectionView();
         _connection.send(new class_188(param1));
      }
      
      private function onNewUserExperienceNotCompleteMessage(param1:class_287) : void
      {
         createNuxOfferView();
      }
      
      private function onNewUserExperienceGiftOfferMessage(param1:class_657) : void
      {
         var _loc2_:class_1141 = param1.getParser();
         createGiftSelectionView(_loc2_.giftOptions);
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         var _loc2_:* = 0;
         if(!getBoolean("nux.lobbies.enabled") || true)
         {
            return;
         }
         if(param1.type == "RSE_STARTED" && param1.session && param1.session.roomId == _navigator.homeRoomId)
         {
            _loc2_ = getInteger("nux.noob.lobby.popup.delay",70) * 1000;
            var_2500 = new Timer(_loc2_,1);
            var_2500.addEventListener("timer",createNoobRoomOfferView);
            var_2500.start();
         }
         else
         {
            destroyNoobRoomOfferView();
         }
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get localizationManager() : class_18
      {
         return _localizationManager;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return _sessionDataManager;
      }
      
      public function get configuration() : class_19
      {
         return this;
      }
      
      public function get catalog() : IHabboCatalog
      {
         return _catalog;
      }
      
      private function createNuxOfferView() : void
      {
         destroyNuxOfferView();
         var_2946 = new com.sulake.habbo.nux.NuxOfferOldUserView(this);
      }
      
      public function destroyNuxOfferView() : void
      {
         if(var_2946)
         {
            var_2946.dispose();
            var_2946 = null;
         }
      }
      
      private function createGiftSelectionView(param1:Vector.<class_1604>) : void
      {
         destroyGiftSelectionView();
         var_2912 = new com.sulake.habbo.nux.NuxGiftSelectionView(this,param1);
      }
      
      private function destroyGiftSelectionView() : void
      {
         if(var_2912)
         {
            var_2912.dispose();
            var_2912 = null;
         }
      }
      
      private function startNoobRoomOfferTimer() : void
      {
      }
      
      private function createNoobRoomOfferView(param1:TimerEvent = null) : void
      {
         if(!getBoolean("nux.lobbies.enabled") || true)
         {
            return;
         }
         destroyNoobRoomOfferView();
         var_2942 = new com.sulake.habbo.nux.NuxNoobRoomOfferView(this);
         _connection.send(new class_898("NewNavigator","nux.offer.lobby","nux.offer.lobby"));
      }
      
      public function destroyNoobRoomOfferView() : void
      {
         if(var_2500)
         {
            var_2500.reset();
            var_2500 = null;
         }
         if(var_2942)
         {
            var_2942.dispose();
            var_2942 = null;
         }
      }
   }
}
