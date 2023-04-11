package com.sulake.habbo.communication.demo
{
   import com.hurlant.crypto.rsa.RSAKey;
   import com.hurlant.math.BigInteger;
   import com.sulake.core.class_79;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.encryption.CryptoTools;
   import com.sulake.core.communication.encryption.IEncryption;
   import com.sulake.core.communication.handshake.class_42;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.communication.login.AvatarData;
   import com.sulake.habbo.utils.CommunicationUtils;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import package_1.class_358;
   import package_1.class_372;
   import package_1.class_477;
   import package_1.class_590;
   import package_1.class_793;
   import package_133.class_1284;
   import package_161.class_1137;
   import package_161.class_1431;
   import package_170.class_1251;
   import package_42.class_1017;
   import package_42.class_1024;
   import package_49.class_898;
   import package_6.class_1036;
   import package_6.class_133;
   import package_6.class_218;
   import package_6.class_251;
   import package_6.class_274;
   import package_6.class_461;
   import package_6.class_463;
   import package_6.class_996;
   import package_60.class_226;
   
   public class IncomingMessages
   {
       
      
      private var var_1460:com.sulake.habbo.communication.demo.class_2028;
      
      private var _communication:class_25;
      
      private var var_2243:class_42;
      
      private var _privateKey:String;
      
      private var var_2437:Boolean;
      
      private var var_2532:Boolean;
      
      private var _messageEvents:Vector.<IMessageEvent>;
      
      private var _rsa:RSAKey;
      
      public function IncomingMessages(param1:com.sulake.habbo.communication.demo.class_2028, param2:class_25)
      {
         _messageEvents = new Vector.<IMessageEvent>(0);
         super();
         var_1460 = param1;
         _communication = param2;
         var _loc3_:IConnection = _communication.connection;
      
         if(_loc3_ == null)
         {
            throw new Error("Connection is required to initialize!");
         }
       
         _loc3_.addEventListener("connect",onConnectionEstablished);
         _loc3_.addEventListener("close",onConnectionDisconnected);
        
         addHabboConnectionMessageEvent(new class_1017(onLoginFailedHotelClosed));
         addHabboConnectionMessageEvent(new class_461(onAuthenticationOK));
         addHabboConnectionMessageEvent(new class_463(onGenericError));
         addHabboConnectionMessageEvent(new class_133(onInitDiffieHandshake));
         addHabboConnectionMessageEvent(new class_226(onErrorReport));
         addHabboConnectionMessageEvent(new class_218(onUniqueMachineId));
         addHabboConnectionMessageEvent(new class_996(onCompleteDiffieHandshake));
         addHabboConnectionMessageEvent(new class_1036(onIdentityAccounts));
         addHabboConnectionMessageEvent(new class_251(onPing));
         addHabboConnectionMessageEvent(new class_274(onDisconnectReason));
         addHabboConnectionMessageEvent(new class_1024(onMaintenance));
       
         var_1460.context.events.addEventListener("unload",unloading);
      }
      
      private static function setReasonProperty(param1:String, param2:String) : String
      {
        
         if(param1.indexOf("%reason%") != -1)
         {
            return param1.replace("%reason%",param2);
         }
         return param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:IConnection = null;
      
         if(_communication)
         {
            _loc1_ = _communication.connection;
          
            if(_loc1_ != null)
            {
               _loc1_.removeEventListener("connect",onConnectionEstablished);
               _loc1_.removeEventListener("close",onConnectionDisconnected);
            }
         
            for each(var _loc2_ in _messageEvents)
            {
               _communication.removeHabboConnectionMessageEvent(_loc2_);
            }
            _messageEvents = new Vector.<IMessageEvent>(0);
         }
      
         var_1460 = null;
         _communication = null;
         var_2243 = null;
      }
      
      private function addHabboConnectionMessageEvent(param1:IMessageEvent) : void
      {
         _communication.addHabboConnectionMessageEvent(param1);
         _messageEvents.push(param1);
      }
      
      private function unloading(param1:Event) : void
      {
         var_2532 = true;
      }
      
      private function onInitDiffieHandshake(param1:IMessageEvent) : void
      {
         var _loc9_:String = null;
         var _loc16_:IConnection = param1.connection;
         var _loc2_:class_133 = param1 as class_133;
         var _loc3_:ByteArray = new ByteArray();
         var _loc4_:ByteArray = new ByteArray();
       
         _loc3_.writeBytes(CryptoTools.hexStringToByteArray(_loc2_.encryptedPrime));
         _loc4_.writeBytes(CryptoTools.hexStringToByteArray(_loc2_.encryptedGenerator));
       
         var _loc5_:ByteArray = new ByteArray();
         var _loc8_:ByteArray = new ByteArray();
        
         //_rsa = RSAKey.parsePublicKey(class_7.method_14(-1820302793),"10001");
         _rsa = RSAKey.parsePublicKey("86851DD364D5C5CECE3C883171CC6DDC5760779B992482BD1E20DD296888DF91B33B936A7B93F06D29E8870F703A216257DEC7C81DE0058FEA4CC5116F75E6EFC4E9113513E45357DC3FD43D4EFAB5963EF178B78BD61E81A14C603B24C8BCCE0A12230B320045498EDC29282FF0603BC7B7DAE8FC1B05B52B2F301A9DC783B7", "3");
         _rsa.verify(_loc3_,_loc5_,_loc3_.length);
         _rsa.verify(_loc4_,_loc8_,_loc4_.length);
      
         var _loc11_:BigInteger = new BigInteger(_loc5_.toString(),10);
         var _loc12_:BigInteger = new BigInteger(_loc8_.toString(),10);
         var _loc10_:BigInteger = BigInteger.nbv(2);
        
         if(_loc11_.compareTo(_loc10_) <= 0 || _loc12_.compareTo(_loc11_) >= 0)
         {
            class_79.crash("Invalid DH prime and generator",29);
            return;
         }
       
         if(_loc11_.equals(_loc12_))
         {
            class_79.crash("Invalid DH prime and generator",29);
            return;
         }
       
         var_2243 = _communication.initializeKeyExchange(_loc11_,_loc12_);
         var _loc6_:* = null;
         var _loc13_:int = 10;
         var _loc7_:String = null;
        
         while(_loc13_ > 0)
         {
            _loc7_ = generateRandomHexString(30);
            var_2243.init(_loc7_);
          
            if((_loc9_ = String(var_2243.getPublicKey(10))).length >= 64)
            {
               _loc6_ = _loc9_;
               _privateKey = _loc7_;
               break;
            }
           
            if(_loc6_ == null || _loc9_.length > _loc6_.length)
            {
               _loc6_ = _loc9_;
               _privateKey = _loc7_;
            }
            _loc13_--;
         }
        
         if(_loc7_ != _privateKey)
         {
            var_2243.init(_privateKey);
         }
       
         var _loc15_:ByteArray = new ByteArray();
         var _loc14_:ByteArray = new ByteArray();
         _loc15_.writeMultiByte(_loc6_,"iso-8859-1");
         _rsa.encrypt(_loc15_,_loc14_,_loc15_.length);
         _loc16_.sendUnencrypted(new class_372(CryptoTools.byteArrayToHexString(_loc14_)));
      }
      
      private function onCompleteDiffieHandshake(param1:IMessageEvent) : void
      {
         var _loc9_:IEncryption = null;
         var _loc7_:IConnection = param1.connection;
         var _loc4_:class_996 = param1 as class_996;
         var _loc6_:ByteArray = new ByteArray();
         var _loc3_:ByteArray = new ByteArray();
         _loc6_.writeBytes(CryptoTools.hexStringToByteArray(_loc4_.encryptedPublicKey));
         _rsa.verify(_loc6_,_loc3_,_loc6_.length);
         _rsa.dispose();
         var_2243.generateSharedKey(_loc3_.toString(),10);
     
         var _loc2_:String = String(var_2243.getSharedKey(16).toUpperCase());
     
         if(!var_2243.isValidServerPublicKey())
         {
            return;
         }
      
         var _loc8_:ByteArray;
         (_loc8_ = CryptoTools.hexStringToByteArray(_loc2_)).position = 0;
      
         var _loc5_:IEncryption;
         (_loc5_ = _communication.initializeEncryption()).init(_loc8_);
        
         if(_loc4_.serverClientEncryption)
         {
            (_loc9_ = _communication.initializeEncryption()).init(_loc8_);
         }
       
         _loc7_.setEncryption(_loc5_,_loc9_);
         var_2437 = false;
         var_1460.dispatchLoginStepEvent("HABBO_CONNECTION_EVENT_HANDSHAKED");
         var_1460.sendConnectionParameters(_loc7_);
      }
      
      private function onAuthenticationOK(param1:IMessageEvent) : void
      {
         var _loc4_:IConnection = param1.connection;
         var_1460.dispatchLoginStepEvent("HABBO_CONNECTION_EVENT_AUTHENTICATED");
         var _loc2_:class_793 = new class_793();
         _loc4_.send(_loc2_);
         var _loc3_:class_898 = new class_898("Login","socket","client.auth_ok");
         _loc4_.send(_loc3_);
         var_1460.loginOk();
      }
      
      private function onLoginFailedHotelClosed(param1:IMessageEvent) : void
      {
         var _loc2_:class_1431 = (param1 as class_1017).getParser();
         var_1460.handleLoginFailedHotelClosedMessage(_loc2_.openHour,_loc2_.openMinute);
      }
      
      private function onGenericError(param1:IMessageEvent) : void
      {
         var _loc2_:class_1284 = (param1 as class_463).getParser();
         switch(_loc2_.errorCode)
         {
            case -3:
               var_1460.alert("${connection.error.id.title}","${connection.login.error.-3.desc}");
               break;
            case -400:
               var_1460.alert("${connection.error.id.title}","${connection.login.error.-400.desc}");
         }
      }
      
      private function onPing(param1:IMessageEvent) : void
      {
         var _loc2_:IConnection = param1.connection;
         var _loc3_:class_358 = new class_358();
         _loc2_.send(_loc3_);
      }
      
      [SecureSWF(controlFlow="0",codeWrap="off")]
      private function onUniqueMachineId(param1:class_218) : void
      {
         CommunicationUtils.writeSOLProperty("machineid",param1.machineID);
      }
      
      private function onIdentityAccounts(param1:class_1036) : void
      {
         var _loc3_:String = null;
         var _loc6_:AvatarData = null;
         var _loc4_:Vector.<AvatarData> = new Vector.<AvatarData>(0);
         var _loc2_:Dictionary = param1.getParser().accounts;
         for(var _loc5_ in _loc2_)
         {
            _loc3_ = String(_loc2_[_loc5_]);
            (_loc6_ = new AvatarData(null)).id = parseInt(_loc5_);
            _loc6_.name = _loc3_;
            _loc4_.push(_loc6_);
         }
         var_1460.onUserList(_loc4_);
      }
      
      private function onErrorReport(param1:IMessageEvent) : void
      {
         var _loc2_:class_1251 = (param1 as class_226).getParser();
         var _loc3_:int = _loc2_.errorCode;
         var _loc4_:int = _loc2_.messageId;
         var_1460.handleErrorMessage(_loc3_,_loc4_);
      }
      
      private function onConnectionEstablished(param1:Event = null) : void
      {
         var _loc2_:IConnection = _communication.connection;
         if(_loc2_ != null)
         {
            var_1460.dispatchLoginStepEvent("HABBO_CONNECTION_EVENT_ESTABLISHED");
            var_2532 = false;
            var_2437 = true;
            var_1460.dispatchLoginStepEvent("HABBO_CONNECTION_EVENT_HANDSHAKING");
            _loc2_.sendUnencrypted(new class_477());
            _loc2_.sendUnencrypted(new class_590());
         }
      }
      
      private function onMaintenance(param1:class_1024) : void
      {
         var _loc2_:class_1137 = param1.parser as class_1137;
         class_14.log("Got maintenance status, with minutes left: " + _loc2_.minutesUntilMaintenance.toString());
         var_1460.localization.registerParameter("disconnected.maintenance_status","%minutes%",_loc2_.minutesUntilMaintenance.toString());
         var _loc3_:String = String(var_1460.localization.getLocalization("disconnected.maintenance_status"));
         var_1460.disconnected(-2,_loc3_);
      }
      
      private function onDisconnectReason(param1:class_274) : void
      {
         if(var_2437)
         {
            var_1460.dispatchLoginStepEvent("HABBO_CONNECTION_EVENT_HANDSHAKE_FAIL");
         }
         class_14.log("[HabboLogin] Got disconnect reason: " + param1.reason);
         var_1460.disconnected(param1.reason,param1.getReasonName());
         var_2437 = false;
         var_2532 = true;
      }
      
      private function handleWebLogout(param1:class_274) : void
      {
         var _loc2_:String = var_1460.getProperty("logout.url");
         if(_loc2_.length > 0)
         {
            _loc2_ = setReasonProperty(_loc2_,param1.reasonString);
            _loc2_ = setOriginProperty(_loc2_);
            _loc2_ += "&id=" + param1.reason;
            if(var_1460.context.configuration.getInteger("spaweb",0) == 1)
            {
               HabboWebTools.sendDisconnectToWeb(param1.reason,param1.reasonString);
            }
            else
            {
               HabboWebTools.openWebPage(_loc2_,"_self");
            }
         }
      }
      
      private function setOriginProperty(param1:String) : String
      {
         if(param1.indexOf("%origin%") != -1)
         {
            return param1.replace("%origin%",var_1460.getProperty("flash.client.origin"));
         }
         return param1;
      }
      
      private function onConnectionDisconnected(param1:Event) : void
      {
         var _loc2_:String = null;
         if(false)
         {
            return;
         }
         if(var_2437)
         {
            var_1460.dispatchLoginStepEvent("HABBO_CONNECTION_EVENT_HANDSHAKE_FAIL");
         }
         if(false)
         {
            ExternalInterface.call("FlashExternalInterface.logDisconnection","Communication failure, client disconnected.");
            if(param1.type == "close" && !var_2532)
            {
               _loc2_ = var_1460.getProperty("logout.disconnect.url");
               _loc2_ = setOriginProperty(_loc2_);
               if(var_1460.context.configuration.getInteger("spaweb",0) == 1)
               {
                  HabboWebTools.sendDisconnectToWeb(-1,"HABBO_CONNECTION_EVENT_HANDSHAKE_FAIL");
               }
               else
               {
                  HabboWebTools.openWebPage(_loc2_,"_self");
               }
            }
         }
         if(param1.type == "close" && !var_2532)
         {
            var_1460.disconnected(-3,"");
         }
      }
      
      private function generateRandomHexString(param1:uint = 16) : String
      {
         var _loc4_:int = 0;
         var _loc3_:* = 0;
         var _loc2_:String = "";
         _loc4_ = 0;
         while(_loc4_ < param1)
         {
            _loc3_ = Math.random() * 255;
            _loc2_ += _loc3_.toString(16);
            _loc4_++;
         }
         return _loc2_;
      }
   }
}
