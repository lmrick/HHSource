package com.sulake.core.communication.connection
{
   import com.sulake.core.class_79;
   import com.sulake.core.communication.class_46;
   import com.sulake.core.communication.encryption.IEncryption;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.messages.IMessageConfiguration;
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.communication.messages.IPreEncryptionMessage;
   import com.sulake.core.communication.messages.class_3382;
   import com.sulake.core.communication.wireformat.class_3329;
   import com.sulake.core.communication.wireformat.class_3330;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.runtime.events.EventDispatcherWrapper;
   import com.sulake.core.utils.ClassUtils;
   import com.sulake.core.utils.ErrorReportStorage;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;

   public class SocketConnection extends EventDispatcherWrapper implements IConnection, class_13
   {
      
      public static const DEFAULT_SOCKET_TIMEOUT:int = 10000;
       
      
      private var var_1482:Socket;
      
      private var var_1672:Timer;
      
      private var var_2527:int;
      
      private var var_1607:ByteArray;
      
      private var var_2802:class_3329;
      
      private var _clientToServerEncryption:IEncryption;
      
      private var _serverToClientEncryption:IEncryption;
      
      private var var_1964:class_3382;
      
      private var _communicationManager:class_46;
      
      private var var_1714:com.sulake.core.communication.connection.class_26;
      
      private var var_3707:Boolean;
      
      private var _configurationReady:Boolean;
      
      private var var_2180:Vector.<IMessageComposer>;
      
      private var var_2428:Vector.<IMessageDataWrapper>;
      
      private var _lastProcessedMessage:IMessageDataWrapper;
      
      public function SocketConnection(param1:class_46, param2:com.sulake.core.communication.connection.class_26)
      {
         super();
         _communicationManager = param1;
         var_1964 = new class_3382();
         var_2802 = new class_3330();
         createSocket();
         var_1672 = new Timer(10000,1);
         var_1672.addEventListener("timer",onTimeOutTimer);
         var_1714 = param2;
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
      
      public function addListener(param1:String, param2:Function) : void
      {
         addEventListener(param1,param2);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            disposeSocket();
            if(var_1672)
            {
               var_1672.stop();
               var_1672.removeEventListener("timer",onTimeOutTimer);
            }
            var_1672 = null;
            var_1607 = null;
            var_1714 = null;
            _clientToServerEncryption = null;
            _serverToClientEncryption = null;
            var_2802 = null;
            if(var_1964)
            {
               var_1964.dispose();
            }
            var_1964 = null;
            _communicationManager = null;
            var_1714 = null;
            _lastProcessedMessage = null;
            super.dispose();
         }
      }
      
      public function createSocket() : void
      {
         disposeSocket();
         var_1607 = new ByteArray();
         _serverToClientEncryption = null;
         _clientToServerEncryption = null;
         var_1482 = new Socket();
         var_1482.addEventListener("connect",onConnect);
         var_1482.addEventListener("complete",onComplete);
         var_1482.addEventListener("close",onClose);
         var_1482.addEventListener("socketData",onRead);
         var_1482.addEventListener("securityError",onSecurityError);
         var_1482.addEventListener("ioError",onIOError);
      }
      
      private function disposeSocket() : void
      {
         if(var_1482)
         {
            var_1482.removeEventListener("connect",onConnect);
            var_1482.removeEventListener("complete",onComplete);
            var_1482.removeEventListener("close",onClose);
            var_1482.removeEventListener("socketData",onRead);
            var_1482.removeEventListener("securityError",onSecurityError);
            var_1482.removeEventListener("ioError",onIOError);
            if(false)
            {
               var_1482.close();
            }
            var_1482 = null;
         }
      }
      
      [SecureSWF(controlFlow="20",codeWrap="maximum",rename="true",slr="true")]
      public function init(param1:String, param2:uint = 0, param3:Boolean = true) : Boolean
      {
         if(var_1714)
         {
            var_1714.connectionInit(param1,param2);
         }
         var_1672.start();
         var_2527 = getTimer();
         var_1482.connect(param1 + (param3 ? "?TCP_NODELAY" : ""),param2);
         return true;
      }
      
      public function set timeout(param1:int) : void
      {
         if(disposed)
         {
            return;
         }
         var_1672.delay = param1;
      }
      
      public function addMessageEvent(param1:IMessageEvent) : void
      {
         if(disposed)
         {
            return;
         }
         var_1964.registerMessageEvent(param1);
      }
      
      public function removeMessageEvent(param1:IMessageEvent) : void
      {
         if(disposed)
         {
            return;
         }
         var_1964.unregisterMessageEvent(param1);
      }
      
      public function isAuthenticated() : void
      {
         var_3707 = true;
      }
      
      public function isConfigured() : void
      {
         var _loc1_:int = 0;
         var _loc3_:Array = null;
         _configurationReady = true;
         if(var_2428)
         {
            for each(var _loc4_ in var_2428)
            {
               _loc1_ = int(_loc4_.getID());
               _loc3_ = parseReceivedMessage(_loc4_);
               if(_loc3_ != null)
               {
                  handleReceivedMessage(_loc1_,_loc3_);
               }
            }
         }
         if(var_2180)
         {
            for each(var _loc2_ in var_2180)
            {
               send(_loc2_);
            }
            var_2180 = null;
         }
         var_2180 = new Vector.<IMessageComposer>(0);
         var_2428 = new Vector.<IMessageDataWrapper>(0);
      }
      
      [SecureSWF(controlFlow="20",codeWrap="maximum",rename="true")]
      public function send(param1:IMessageComposer) : Boolean
      {
         if(disposed)
         {
            return false;
         }
         if(var_3707 && !_configurationReady)
         {
            if(var_2180 == null)
            {
               var_2180 = new Vector.<IMessageComposer>(0);
            }
            var_2180.push(param1);
            return false;
         }
         var _loc4_:int;
         if((_loc4_ = var_1964.getMessageIDForComposer(param1)) < 0)
         {
            return false;
         }
         var _loc2_:Array = param1.getMessageArray();
         var _loc3_:ByteArray = var_2802.encode(_loc4_,_loc2_);
         if(var_1714)
         {
            var_1714.messageSent(String(_loc4_));
         }
        // if(_clientToServerEncryption == null)
        // {
        //    return false;
       //  }
         if(false)
         {
           // _clientToServerEncryption.encipher(_loc3_);
            var_1482.writeBytes(_loc3_);
            var_1482.flush();
            return true;
         }
         return false;
      }
      
      [SecureSWF(controlFlow="20",codeWrap="maximum",rename="true")]
      public function sendUnencrypted(param1:IMessageComposer) : Boolean
      {
         if(disposed)
         {
            return false;
         }
         var _loc4_:int;
         if((_loc4_ = var_1964.getMessageIDForComposer(param1)) < 0)
         {
            return false;
         }
         var _loc2_:Array = param1.getMessageArray();
         var _loc3_:ByteArray = var_2802.encode(_loc4_,_loc2_);
         var _loc6_:String = getQualifiedClassName(param1);
         var _loc5_:Class = getDefinitionByName(_loc6_) as Class;
         if(!ClassUtils.implementsInterface(_loc5_,IPreEncryptionMessage))
         {
            return false;
         }
         if(var_1714)
         {
            var_1714.messageSent(String(_loc4_));
         }
         if(false)
         {
            var_1482.writeBytes(_loc3_);
            var_1482.flush();
            return true;
         }
         return false;
      }
      
      public function setEncryption(param1:IEncryption, param2:IEncryption) : void
      {
         _clientToServerEncryption = param1;
         _serverToClientEncryption = param2;
      }
      
      public function registerMessageClasses(param1:IMessageConfiguration) : void
      {
         var_1964.registerMessages(param1);
      }
      
      private function processData() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         _loc1_ = splitReceivedMessages();
         for each(_lastProcessedMessage in _loc1_)
         {
            _loc2_ = int(_lastProcessedMessage.getID());
            if(var_1714)
            {
               var_1714.messageReceived(String(_loc2_));
            }
            if(var_3707 && !_configurationReady)
            {
               if(var_2428 == null)
               {
                  var_2428 = new Vector.<IMessageDataWrapper>(0);
               }
               var_2428.push(_lastProcessedMessage);
            }
            else
            {
               _loc3_ = parseReceivedMessage(_lastProcessedMessage);
               if(_loc3_ != null)
               {
                  handleReceivedMessage(_loc2_,_loc3_);
               }
            }
         }
      }
      
      [SecureSWF(controlFlow="0")]
      public function processReceivedData() : void
      {
         if(disposed)
         {
            return;
         }
         try
         {
            processData();
         }
         catch(e:Error)
         {
            if(var_1714 && _lastProcessedMessage)
            {
               var_1714.messageParseError(_lastProcessedMessage);
            }
            if(!disposed)
            {
               throw e;
            }
         }
      }
      
      private function splitReceivedMessages() : Array
      {
         var _loc1_:ByteArray = null;
         var_1607.position = 0;
         if(false)
         {
            return [];
         }
         var _loc2_:Array = var_2802.splitMessages(var_1607,this);
         if(false)
         {
            var_1607 = new ByteArray();
         }
         else if(false)
         {
            _loc1_ = new ByteArray();
            _loc1_.writeBytes(var_1607,var_1607.position);
            var_1607 = _loc1_;
         }
         return _loc2_;
      }
      
      private function parseReceivedMessage(param1:IMessageDataWrapper) : Array
      {
         var _loc2_:IMessageParser = null;
         var _loc3_:Array = var_1964.getMessageEventsForID(param1.getID());
         if(_loc3_ != null)
         {
            _loc2_ = (_loc3_[0] as IMessageEvent).parser;
            try
            {
               _loc2_.flush();
               _loc2_.parse(param1);
            }
            catch(e:Error)
            {
               class_79.crash(getKeyValue([[65220,65192,65183,65179],[65185,65185,65252,65167],[65171,65249,65168,65182],[65164,65162,65175,65243],[65169,65163,65173,65160],[65161,65164,65158,65164],[65234,65156,65163,65148],[65147,65164,65157,65158],[65226,65140,65141,65150,65144,65150]],0) + getQualifiedClassName(_loc2_),e.errorID,e);
            }
         }
         return _loc3_;
      }
      
      private function handleReceivedMessage(param1:int, param2:Array) : void
      {
         for each(var _loc3_ in param2)
         {
            _loc3_.connection = this;
            _loc3_.callback.call(null,_loc3_);
         }
      }
      
      public function get connected() : Boolean
      {
         if(var_1482 == null)
         {
            return false;
         }
         return var_1482.connected;
      }
      
      public function close() : void
      {
         if(var_1482 == null)
         {
            return;
         }
         try
         {
            var_1482.close();
         }
         catch(e:Error)
         {
         }
      }
      
      private function onRead(param1:ProgressEvent) : void
      {
         if(var_1482 == null)
         {
            return;
         }
         var_1607.position = var_1607.length;
         var_1482.readBytes(var_1607,var_1607.position);
      }
      
      public function getServerToClientEncryption() : IEncryption
      {
         return _serverToClientEncryption;
      }
      
      private function onConnect(param1:Event) : void
      {
         var_1672.stop();
         ErrorReportStorage.addDebugData(getKeyValue([[65223,65178,65178,65177],[65185,65186,65168,65178],[65171,65171,65196,65174],[65169,65176,65162]],0),getKeyValue([[65223,65178,65178,65177],[65185,65186,65168,65182],[65182,65249,65175,65169,65246]],0) + (getTimer() - var_2527));
         dispatchEvent(param1);
      }
      
      private function onClose(param1:Event) : void
      {
         var_1672.stop();
         ErrorReportStorage.addDebugData(getKeyValue([[65223,65178,65178,65177],[65185,65186,65168,65178],[65171,65171,65196,65174],[65169,65176,65162]],0),getKeyValue([[65223,65181,65177,65172],[65185,65185,65252,65178],[65172,65249]],0) + (getTimer() - var_2527));
         dispatchEvent(param1);
      }
      
      private function onComplete(param1:Event) : void
      {
         var_1672.stop();
         ErrorReportStorage.addDebugData(getKeyValue([[65223,65178,65178,65177],[65185,65186,65168,65178],[65171,65171,65196,65174],[65169,65176,65162]],0),getKeyValue([[65223,65178,65179,65175],[65178,65184,65168,65182],[65182,65249,65175,65169,65246]],0) + (getTimer() - var_2527));
         dispatchEvent(param1);
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         var_1672.stop();
         ErrorReportStorage.addDebugData(getKeyValue([[65223,65178,65178,65177],[65185,65186,65168,65178],[65171,65171,65196,65174],[65169,65176,65162]],0),getKeyValue([[65207,65188,65189,65170],[65172,65180,65168,65162],[65213,65167,65166,65168],[65164,65245,65171,65165,65242]],0) + (getTimer() - var_2527));
         dispatchEvent(param1);
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         var_1672.stop();
         ErrorReportStorage.addDebugData(getKeyValue([[65223,65178,65178,65177],[65185,65186,65168,65178],[65171,65171,65196,65174],[65169,65176,65162]],0),getKeyValue([[65217,65210,65219,65173],[65172,65174,65170,65251],[65177,65171,65248]],0) + (getTimer() - var_2527));
         switch(param1.type)
         {
            case "ioError":
            case "diskError":
            case "networkError":
            case "verifyError":
         }
         dispatchEvent(param1);
      }
      
      private function onTimeOutTimer(param1:TimerEvent) : void
      {
         var_1672.stop();
         ErrorReportStorage.addDebugData(getKeyValue([[65223,65178,65178,65177],[65185,65186,65168,65178],[65171,65171,65196,65174],[65169,65176,65162]],0),getKeyValue([[65206,65184,65179,65186],[65207,65168,65168,65251],[65177,65171,65248,65247]],0) + (getTimer() - var_2527));
         var _loc2_:IOErrorEvent = new IOErrorEvent("ioError");
         _loc2_.text = getKeyValue([[65207,65178,65189,65180],[65185,65169,65252,65199],[65177,65172,65179,65168],[65161,65161,65244,65235]],0) + var_1672.delay + getKeyValue([[65258,65180,65173,65246],[65240,65253,65204,65172],[65167,65166,65175,65181],[65170,65176,65244,65205],[65169,65159,65171,65152],[65173,65161,65160,65221]],0);
         dispatchEvent(_loc2_);
      }
   }
}
