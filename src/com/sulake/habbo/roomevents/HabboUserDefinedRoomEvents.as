package com.sulake.habbo.roomevents
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.habbo.room.class_1678;
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.display.BitmapData;
   
   public class HabboUserDefinedRoomEvents extends class_20 implements IHabboUserDefinedRoomEvents
   {
       
      
      private var _windowManager:class_1684;
      
      private var _communication:class_25;
      
      private var _localization:class_18;
      
      private var var_3706:UserDefinedRoomEventsCtrl;
      
      private var var_2619:com.sulake.habbo.roomevents.class_3136;
      
      private var _roomEngine:IRoomEngine;
      
      private var _roomSession:IRoomSession;
      
      private var _sessionDataManager:ISessionDataManager;
      
      private var _userName:String;
      
      public function HabboUserDefinedRoomEvents(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         super(param1,param2,param3);
         var_3706 = new UserDefinedRoomEventsCtrl(this);
      }
      
      public function get communication() : class_25
      {
         return _communication;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get localization() : class_18
      {
         return _localization;
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communication = param1;
         }),new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         }),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localization = param1;
         }),new ComponentDependency(new IIDRoomEngine(),function(param1:IRoomEngine):void
         {
            _roomEngine = param1;
         }),new ComponentDependency(new IIDHabboRoomSessionManager(),null,false,[{
            "type":"RSE_CREATED",
            "callback":roomSessionStateEventHandler
         },{
            "type":"RSE_STARTED",
            "callback":roomSessionStateEventHandler
         },{
            "type":"RSE_ENDED",
            "callback":roomSessionStateEventHandler
         }]),new ComponentDependency(new IIDSessionDataManager(),function(param1:ISessionDataManager):void
         {
            _sessionDataManager = param1;
         })]);
      }
      
      override protected function initComponent() : void
      {
         var_2619 = new com.sulake.habbo.roomevents.class_3136(this);
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(var_2619 != null)
         {
            var_2619.dispose();
            var_2619 = null;
         }
         super.dispose();
      }
      
      public function stuffSelected(param1:int, param2:String) : void
      {
         var _loc3_:ISelectedRoomObjectData = (_roomEngine as class_1678).getPlacedObjectData(roomId);
         if(_loc3_ && _loc3_.id == -param1)
         {
            (_roomEngine as class_1678).setPlacedObjectData(roomId,null);
            return;
         }
         var_3706.stuffSelected(param1,param2);
      }
      
      public function send(param1:IMessageComposer, param2:Boolean = false) : void
      {
         _communication.connection.send(param1);
      }
      
      public function getXmlWindow(param1:String) : class_3127
      {
         var _loc4_:IAsset = null;
         var _loc2_:XmlAsset = null;
         var _loc3_:class_3127 = null;
         try
         {
            _loc4_ = assets.getAssetByName(param1 + "_xml");
            _loc2_ = XmlAsset(_loc4_);
            _loc3_ = _windowManager.buildFromXML(XML(_loc2_.content));
         }
         catch(e:Error)
         {
         }
         return _loc3_;
      }
      
      public function refreshButton(param1:class_3151, param2:String, param3:Boolean, param4:Function, param5:int, param6:String = null) : void
      {
         if(!param6)
         {
            param6 = param2;
         }
         var _loc7_:class_3282 = param1.findChildByName(param2) as class_3282;
         if(!param3)
         {
            _loc7_.visible = false;
         }
         else
         {
            prepareButton(_loc7_,param6,param4,param5);
            _loc7_.visible = true;
         }
      }
      
      private function prepareButton(param1:class_3282, param2:String, param3:Function, param4:int) : void
      {
         param1.id = param4;
         param1.procedure = param3;
         if(param1.bitmap != null)
         {
            return;
         }
         param1.bitmap = getButtonImage(param2);
         param1.width = param1.bitmap.width;
         param1.height = param1.bitmap.height;
      }
      
      public function getButtonImage(param1:String, param2:String = "_png") : BitmapData
      {
         var _loc4_:String = param1 + param2;
         var _loc6_:IAsset = assets.getAssetByName(_loc4_);
         var _loc5_:BitmapDataAsset = BitmapDataAsset(_loc6_);
         var _loc3_:BitmapData = BitmapData(_loc5_.content);
         return _loc3_.clone();
      }
      
      public function get userDefinedRoomEventsCtrl() : UserDefinedRoomEventsCtrl
      {
         return var_3706;
      }
      
      public function get roomEngine() : IRoomEngine
      {
         return _roomEngine;
      }
      
      private function roomSessionStateEventHandler(param1:RoomSessionEvent) : void
      {
         if(_roomEngine == null)
         {
            return;
         }
         switch(param1.type)
         {
            case "RSE_CREATED":
            case "RSE_STARTED":
            case "RSE_ENDED":
               _roomSession = param1.session;
         }
      }
      
      public function get roomId() : int
      {
         return !!_roomSession ? _roomSession.roomId : 0;
      }
      
      public function get roomSession() : IRoomSession
      {
         return _roomSession;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function set userName(param1:String) : void
      {
         _userName = param1;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return _sessionDataManager;
      }
   }
}
