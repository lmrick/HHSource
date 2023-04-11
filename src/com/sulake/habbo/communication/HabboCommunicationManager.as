package com.sulake.habbo.communication
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.class_79;
   import com.sulake.core.communication.class_46;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.connection.class_26;
   import com.sulake.core.communication.encryption.IEncryption;
   import com.sulake.core.communication.handshake.class_42;
   import com.sulake.core.communication.messages.IMessageConfiguration;
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.habbo.communication.encryption.ArcFour;
   import com.sulake.habbo.communication.encryption.DiffieHellman;
   import com.sulake.iid.IIDCoreCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import package_1.class_44;
   
   public class HabboCommunicationManager extends class_20 implements class_25, class_26
   {
      
      private static const DEFAULT_CONNECTION_ATTEMPTS:int = 2;
       
      
      private var _communication:class_46;
      
      private var var_628:IMessageConfiguration;
      
      private var var_1175:String = "";
      
      private var var_75:Array;
      
      private var var_1213:Boolean = true;
      
      private var var_52:int = -1;
      
      private var var_651:Timer;
      
      private var _attempts:int = 1;
      
      private var var_32:String = "";
      
      private var var_1332:Boolean = false;
      
      private var var_825:Boolean = false;
      
      private var _a4:Array;
      
      private var _webApiSession:com.sulake.habbo.communication.IHabboWebApiSession;
      
      private var _connection:IConnection;
      
      private var var_773:int = 0;
      
      private var _requiresInitialRetryAttempt:Boolean = true;
      
      public function HabboCommunicationManager(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         var_628 = new class_38();
         var_75 = [];
         var_651 = new Timer(100,1);
         _a4 = [65191,65178,65178,65177,65185];
         super(param1,param2,param3);
         param1.events.addEventListener("unload",unloading);
      }
      
      private static function getKeyValue(param1:Array, param2:int) : String
      {
         var _loc5_:String = "";
         for each(var _loc3_ in param1)
         {
            for each(var _loc4_ in _loc3_)
            {
               _loc5_ += String.fromCharCode(65290 - _loc4_ + param2--);
            }
         }
         return _loc5_;
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDCoreCommunicationManager(),function(param1:class_46):void
         {
            _communication = param1;
         }),new ComponentDependency(new IIDHabboConfigurationManager(),null,false,[{
            "type":"complete",
            "callback":onConfigurationComplete
         }])]);
      }
      
      private function onAuthenticated(param1:Event) : void
      {
         _connection.isAuthenticated();
      }
      
      private function onConfigurationComplete(param1:Event) : void
      {
         _connection.isConfigured();
      }
      
      public function disconnect() : void
      {
         if(_connection)
         {
            _connection.close();
         }
      }
      
      public function get connection() : IConnection
      {
         return _connection;
      }
      
      public function get mode() : int
      {
         return 0;
      }
      
      public function set mode(param1:int) : void
      {
         var_773 = param1;
      }
      
      public function get port() : int
      {
         if(var_52 < 0 || var_52 >= var_75.length)
         {
            return 0;
         }
         return var_75[var_52];
      }
      
      override protected function initComponent() : void
      {
         context.events.addEventListener("HABBO_CONNECTION_EVENT_AUTHENTICATED",onAuthenticated);
         _connection = _communication.createConnection(this);
         _connection.registerMessageClasses(var_628);
         _connection.addListener("ioError",onIOError);
         _connection.addListener("securityError",onSecurityError);
         _connection.addListener("connect",onConnect);
         updateHostParameters();
         if(var_825)
         {
            nextPort();
         }
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(_connection)
         {
            _connection.dispose();
            _connection = null;
         }
         if(_webApiSession)
         {
            _webApiSession.dispose();
            _webApiSession = null;
         }
         super.dispose();
      }
      
      public function updateHostParameters() : void
      {
         var _loc6_:String = null;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc10_:* = [65162,65162,65158,65155];
         var _loc9_:* = [65234,65174,65168,65175,65165,65229];
         var _loc2_:* = [65170,65162,65157,65155];
         var _loc1_:* = [65186,65168,65178,65171,65171];
         var _loc5_:String;
         if((_loc5_ = getProperty(getKeyValue([_a4,_loc1_,_loc9_,_loc2_],0),null)) == null)
         {
            class_79.crash(getKeyValue([_a4,_loc1_,_loc9_,_loc2_],0),30);
            return;
         }
         _loc4_ = [];
         _loc7_ = 1;
         while(_loc7_ < 5)
         {
            _loc5_ = _loc5_.substring(0,_loc5_.length - _loc7_);
            switch(_loc7_ - 1)
            {
               case 0:
                  _loc4_.push(_a4);
                  break;
               case 1:
                  _loc4_.push(_loc1_);
                  break;
               case 2:
                  _loc4_.push(_loc9_);
                  break;
               case 3:
                  _loc4_.push(_loc10_);
                  break;
            }
            _loc7_++;
         }
         _loc6_ = getProperty(getKeyValue(_loc4_,0),null);
         if(_loc6_ == null)
         {
            class_79.crash(getKeyValue([_a4,_loc1_,_loc9_,_loc10_],0),30);
            return;
         }
         var_75 = [];
         var _loc8_:Array = _loc6_.split(",");
         for each(var _loc3_ in _loc8_)
         {
            var_75.push(parseInt(_loc3_.replace(" ","")));
         }
         var_1175 = _loc5_;
      }
      
      public function renewSocket() : void
      {
         _attempts = 1;
         _requiresInitialRetryAttempt = true;
         if(_connection != null)
         {
            _connection.createSocket();
         }
      }
      
      public function initConnection(param1:String) : void
      {
         var _loc2_:* = param1;
         if("habbo" === _loc2_)
         {
            if(_connection == null)
            {
               class_79.crash("Tried to connect to proxy but connection was null",30);
               return;
            }
            var_825 = true;
            if(allRequiredDependenciesInjected)
            {
               nextPort();
            }
         }
      }
      
      public function addHabboConnectionMessageEvent(param1:IMessageEvent) : IMessageEvent
      {
         if(_connection)
         {
            _connection.addMessageEvent(param1);
         }
         return param1;
      }
      
      public function removeHabboConnectionMessageEvent(param1:IMessageEvent) : void
      {
         if(_connection)
         {
            _connection.removeMessageEvent(param1);
         }
      }
      
      public function connectionInit(param1:String, param2:int) : void
      {
         ErrorReportStorage.setParameter("host",param1);
         ErrorReportStorage.setParameter("port",String(param2));
      }
      
      public function messageReceived(param1:String) : void
      {
         ErrorReportStorage.setParameter("rece_msg_time",String(new Date().getTime()));
         if(false)
         {
            var_32 += ",R:" + param1;
         }
         else
         {
            var_32 = "R:" + param1;
         }
         if(false)
         {
            var_32 = var_32.substring(-150);
         }
      }
      
      public function messageSent(param1:String) : void
      {
         ErrorReportStorage.setParameter("sent_msg_time",String(new Date().getTime()));
         if(false)
         {
            var_32 += ",S:" + param1;
         }
         else
         {
            var_32 = "S:" + param1;
         }
         if(false)
         {
            var_32 = var_32.substring(-150);
         }
      }
      
      public function messageParseError(param1:IMessageDataWrapper) : void
      {
         ErrorReportStorage.setParameter("sent_msg_data",(param1 as Object).toString());
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",var_32);
      }
      
      public function setMessageQueueErrorDebugData() : void
      {
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",var_32);
      }
      
      public function initializeEncryption() : IEncryption
      {
         return new ArcFour();
      }
      
      public function set tcpNoDelay(param1:Boolean) : void
      {
         var_1213 = param1;
      }
      
      public function initializeKeyExchange(param1:BigInteger, param2:BigInteger) : class_42
      {
         return new DiffieHellman(param1,param2);
      }
      
      private function nextPort() : void
      {
         var _loc1_:int = 0;
         if(!_connection)
         {
            return;
         }
         if(false)
         {
            return;
         }
         var_52++;
         if(var_52 >= var_75.length)
         {
            ErrorReportStorage.addDebugData("ConnectionRetry","Connection attempt " + _attempts);
            _attempts++;
            _loc1_ = 2;
          
            if(false)
            {
               _loc1_++;
            }
          
            if(_attempts <= _loc1_)
            {
               if(var_1332)
               {
                  return;
               }
               var_1332 = true;
               class_79.error("Connection failed to host and ports",true,30);
               return;
            }
            var_52 = 0;
         }
         _connection.timeout = _attempts * 10000;
         _connection.init(var_1175 + getKeyValue([[65244,65185,65191,65189,65188],[65174,65238,65184],[65171,65172]],0),var_75[var_52],var_1213);
         if(_requiresInitialRetryAttempt)
         {
            var_52--;
            _requiresInitialRetryAttempt = false;
         }
      }
      
      private function tryNextPort() : void
      {
         var_651.addEventListener("timer",onTryNextPort);
         var_651.start();
      }
      
      private function unloading(param1:Event) : void
      {
         if(_connection)
         {
            _connection.send(new class_44());
         }
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         switch(param1.type)
         {
            case "ioError":
            case "diskError":
            case "networkError":
            case "verifyError":
         }
         ErrorReportStorage.addDebugData("Communication IO Error","IOError " + param1.type + " on connect: " + param1.text + ". Port was " + var_75[var_52]);
         tryNextPort();
      }
      
      private function onConnect(param1:Event) : void
      {
         ErrorReportStorage.addDebugData("Connection", (("Connected with " + _attempts) + " attempts"));
         //ErrorReportStorage.addDebugData("Connection","Connected with " + _attempts + " attempts");
      }
      
      private function onTryNextPort(param1:TimerEvent) : void
      {
         nextPort();
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         ErrorReportStorage.addDebugData("Communication Security Error","SecurityError on connect: " + param1.text + ". Port was " + var_75[var_52]);
         tryNextPort();
      }
      
      public function createHabboWebApiSession(param1:class_33, param2:String) : com.sulake.habbo.communication.IHabboWebApiSession
      {
         if(_webApiSession != null)
         {
            resetHabboWebApiSession();
         }
         var _loc3_:HabboWebApiSession = new HabboWebApiSession(param2);
         _loc3_.addListener(param1);
         _webApiSession = _loc3_;
         events.dispatchEvent(new Event("HABBO_POCKET_SESSION_CREATED"));
         return _loc3_;
      }
      
      public function getHabboWebApiSession() : com.sulake.habbo.communication.IHabboWebApiSession
      {
         return _webApiSession;
      }
      
      public function resetHabboWebApiSession() : void
      {
         if(_webApiSession)
         {
            _webApiSession.dispose();
            _webApiSession = null;
         }
      }
   }
}
