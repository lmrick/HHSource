package com.sulake.habbo.session
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.tracking.class_1693;
   import flash.utils.getTimer;
   import package_111.class_661;
   import package_111.class_772;
   import package_111.class_791;
   import package_111.class_801;
   import package_111.class_933;
   import package_13.class_137;
   import package_13.class_145;
   import package_13.class_187;
   import package_13.class_401;
   import package_13.class_484;
   import package_13.class_489;
   import package_13.class_560;
   import package_13.class_899;
   import package_13.class_965;
   import package_13.class_983;
   import package_21.class_371;
   import package_21.class_542;
   import package_21.class_629;
   import package_21.class_725;
   import package_21.class_745;
   import package_21.class_995;
   import package_22.class_154;
   import package_22.class_316;
   import package_22.class_916;
   import package_27.class_160;
   import package_27.class_293;
   import package_27.class_713;
   import package_33.class_841;
   import package_34.class_552;
   import package_34.class_685;
   import package_34.class_698;
   import package_34.class_869;
   import package_34.class_989;
   import package_43.class_761;
   import package_47.Game2GameChatMessageComposer;
   import package_49.class_898;
   import package_62.class_229;
   import package_62.class_328;
   import package_62.class_460;
   import package_62.class_499;
   import package_62.class_519;
   import package_62.class_563;
   import package_62.class_620;
   import package_62.class_977;
   import package_76.class_781;
   import package_78.class_1621;
   import package_87.class_357;
   import package_87.class_885;
   
   public class RoomSession implements IRoomSession
   {
       
      
      private const CHAT_LAG_WARNING_LIMIT:int = 2500;
      
      private var _connection:IConnection;
      
      private var var_354:int = 0;
      
      private var var_976:String = "";
      
      private var var_4210:String = "";
      
      private var var_2017:IMessageComposer = null;
      
      private var var_159:String = "RSE_CREATED";
      
      private var var_2320:com.sulake.habbo.session.UserDataManager;
      
      private var var_3939:int = -1;
      
      private var var_2922:Boolean = false;
      
      private var var_1362:int = 0;
      
      private var var_776:int = 0;
      
      private var _isGuildRoom:Boolean = false;
      
      private var var_3325:Boolean = false;
      
      private var var_4213:Boolean = false;
      
      private var var_719:int;
      
      private var var_2579:class_24;
      
      private var var_731:int = 0;
      
      private var _habboTracking:class_1693 = null;
      
      private var var_3755:Boolean = false;
      
      private var _isGameSession:Boolean = false;
      
      private var var_4256:Boolean = false;
      
      private var var_412:class_1621 = null;
      
      public function RoomSession()
      {
         var_2579 = new class_24();
         super();
         var_2320 = new com.sulake.habbo.session.UserDataManager();
      }
      
      public function set connection(param1:IConnection) : void
      {
         if(param1 == null)
         {
            return;
         }
         _connection = param1;
         if(var_2320 != null)
         {
            var_2320.connection = param1;
         }
      }
      
      public function dispose() : void
      {
         _connection = null;
         if(var_2320 != null)
         {
            var_2320.dispose();
            var_2320 = null;
         }
         if(var_2579 != null)
         {
            var_2579.dispose();
            var_2579 = null;
         }
         if(var_2017)
         {
            var_2017.dispose();
            var_2017 = null;
         }
         if(var_412 != null)
         {
            var_412 = null;
         }
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function set roomId(param1:int) : void
      {
         var_354 = param1;
      }
      
      public function get roomPassword() : String
      {
         return var_976;
      }
      
      public function set roomPassword(param1:String) : void
      {
         var_976 = param1;
      }
      
      public function get roomResources() : String
      {
         return var_4210;
      }
      
      public function set roomResources(param1:String) : void
      {
         var_4210 = param1;
      }
      
      public function get openConnectionComposer() : IMessageComposer
      {
         return var_2017;
      }
      
      public function set openConnectionComposer(param1:IMessageComposer) : void
      {
         var_2017 = param1;
      }
      
      public function get state() : String
      {
         return var_159;
      }
      
      public function get habboTracking() : class_1693
      {
         return _habboTracking;
      }
      
      public function set habboTracking(param1:class_1693) : void
      {
         _habboTracking = param1;
      }
      
      public function get isGameSession() : Boolean
      {
         return _isGameSession;
      }
      
      public function set isGameSession(param1:Boolean) : void
      {
         _isGameSession = param1;
      }
      
      public function get roomModerationSettings() : class_1621
      {
         return var_412;
      }
      
      public function set roomModerationSettings(param1:class_1621) : void
      {
         var_412 = param1;
      }
      
      public function trackEventLogOncePerSession(param1:String, param2:String, param3:String) : void
      {
         _habboTracking.trackEventLogOncePerSession(param1,param2,param3);
      }
      
      public function start() : Boolean
      {
         if(var_159 == "RSE_CREATED" && _connection != null)
         {
            var_159 = "RSE_STARTED";
            if(var_2017)
            {
               return sendPredefinedOpenConnection();
            }
            return sendOpenFlatConnectionMessage();
         }
         return false;
      }
      
      public function reset(param1:int) : void
      {
         if(param1 != var_354)
         {
            var_354 = param1;
            var_2922 = false;
            var_1362 = 0;
            var_776 = 0;
            var_3325 = false;
         }
      }
      
      private function sendOpenFlatConnectionMessage() : Boolean
      {
         if(_connection == null)
         {
            return false;
         }
         _connection.send(new class_916(var_354,var_976));
         return true;
      }
      
      private function sendPredefinedOpenConnection() : Boolean
      {
         if(_connection == null)
         {
            return false;
         }
         _connection.send(var_2017);
         var_2017 = null;
         return true;
      }
      
      public function sendChatMessage(param1:String, param2:int = 0) : void
      {
         if(_isGameSession)
         {
            _connection.send(new Game2GameChatMessageComposer(param1));
         }
         else
         {
            param1 = param1.replace(/&#[0-9]+;/g,"");
            _connection.send(new class_661(param1,param2,var_731));
            var_2579.add(var_731,getTimer());
            var_731++;
         }
      }
      
      public function sendChangeMottoMessage(param1:String) : void
      {
         _connection.send(new class_698(param1));
      }
      
      public function receivedChatWithTrackingId(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Object = var_2579.remove(param1);
         if(_loc2_ != null)
         {
            _loc3_ = getTimer();
            if(_loc3_ - int(_loc2_) > 2500)
            {
               if(_habboTracking != null)
               {
                  _habboTracking.chatLagDetected(_loc3_);
               }
            }
         }
      }
      
      public function sendShoutMessage(param1:String, param2:int = 0) : void
      {
         _connection.send(new class_772(param1,param2));
      }
      
      public function sendWhisperMessage(param1:String, param2:String, param3:int = 0) : void
      {
         _connection.send(new class_801(param1,param2,param3));
      }
      
      public function sendChatTypingMessage(param1:Boolean) : void
      {
         if(param1)
         {
            _connection.send(new class_933());
         }
         else
         {
            _connection.send(new class_791());
         }
      }
      
      public function sendAvatarExpressionMessage(param1:int) : void
      {
         _connection.send(new class_989(param1));
      }
      
      public function sendSignMessage(param1:int) : void
      {
         if(param1 >= 0 && param1 <= 17)
         {
            _connection.send(new class_552(param1));
         }
      }
      
      public function sendDanceMessage(param1:int) : void
      {
         _connection.send(new class_685(param1));
      }
      
      public function sendChangePostureMessage(param1:int) : void
      {
         _connection.send(new class_869(param1));
      }
      
      public function sendCreditFurniRedeemMessage(param1:int) : void
      {
         _connection.send(new class_995(param1));
      }
      
      public function sendPresentOpenMessage(param1:int) : void
      {
         _connection.send(new class_725(param1));
      }
      
      public function sendOpenPetPackageMessage(param1:int, param2:String) : void
      {
         _connection.send(new class_371(param1,param2));
      }
      
      public function sendRoomDimmerGetPresetsMessage() : void
      {
         _connection.send(new class_629());
      }
      
      public function sendRoomDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean) : void
      {
         var _loc6_:String = "000000" + param3.toString(16).toUpperCase();
         var _loc7_:String = "#" + _loc6_.substr(_loc6_.length - 6);
         _connection.send(new class_745(param1,param2,_loc7_,param4,param5));
      }
      
      public function sendRoomDimmerChangeStateMessage() : void
      {
         _connection.send(new class_542());
      }
      
      public function sendConversionPoint(param1:String, param2:String, param3:String, param4:String = null, param5:int = 0) : void
      {
         _connection.send(new class_898(param1,param2,param3,param4,param5));
      }
      
      public function sendPollStartMessage(param1:int) : void
      {
         _connection.send(new class_293(param1));
      }
      
      public function sendPollRejectMessage(param1:int) : void
      {
         _connection.send(new class_713(param1));
      }
      
      public function sendPollAnswerMessage(param1:int, param2:int, param3:Array) : void
      {
         _connection.send(new class_160(param1,param2,param3));
      }
      
      public function sendPeerUsersClassificationMessage(param1:String) : void
      {
         _connection.send(new class_885(param1));
      }
      
      public function sendRoomUsersClassificationMessage(param1:String) : void
      {
         _connection.send(new class_357(param1));
      }
      
      public function sendVisitFlatMessage(param1:int) : void
      {
         _connection.send(new class_916(param1));
      }
      
      public function sendVisitUserMessage(param1:String) : void
      {
         _connection.send(new class_841(param1));
      }
      
      public function ambassadorAlert(param1:int) : void
      {
         _connection.send(new class_460(param1));
      }
      
      public function kickUser(param1:int) : void
      {
         _connection.send(new class_977(param1));
      }
      
      public function banUserWithDuration(param1:int, param2:String) : void
      {
         _connection.send(new class_620(param1,param2,roomId));
      }
      
      public function muteUser(param1:int, param2:int) : void
      {
         _connection.send(new class_229(param1,param2,roomId));
      }
      
      public function unmuteUser(param1:int) : void
      {
         _connection.send(new class_499(param1,roomId));
      }
      
      public function assignRights(param1:int) : void
      {
         _connection.send(new class_563(param1));
      }
      
      public function removeRights(param1:int) : void
      {
         var _loc3_:* = [];
         _loc3_.push(param1);
         var _loc2_:class_519 = new class_519(_loc3_);
         _connection.send(_loc2_);
      }
      
      public function letUserIn(param1:String, param2:Boolean) : void
      {
         _connection.send(new class_328(param1,param2));
      }
      
      public function pickUpPet(param1:int) : void
      {
         _connection.send(new class_145(param1));
      }
      
      public function mountPet(param1:int) : void
      {
         _connection.send(new class_983(param1,true));
      }
      
      public function togglePetRidingPermission(param1:int) : void
      {
         _connection.send(new class_965(param1));
      }
      
      public function togglePetBreedingPermission(param1:int) : void
      {
         _connection.send(new class_401(param1));
      }
      
      public function dismountPet(param1:int) : void
      {
         _connection.send(new class_983(param1,false));
      }
      
      public function removeSaddleFromPet(param1:int) : void
      {
         _connection.send(new class_489(param1));
      }
      
      public function harvestPet(param1:int) : void
      {
         _connection.send(new class_137(param1));
      }
      
      public function compostPlant(param1:int) : void
      {
         _connection.send(new class_187(param1));
      }
      
      public function requestPetCommands(param1:int) : void
      {
         _connection.send(new class_899(param1));
      }
      
      public function useProductForPet(param1:int, param2:int) : void
      {
         _connection.send(new class_781(param1,param2));
      }
      
      public function plantSeed(param1:int) : void
      {
         _connection.send(new class_560(param1));
      }
      
      public function sendScriptProceed() : void
      {
         _connection.send(new class_761());
      }
      
      public function quit() : void
      {
         if(_connection != null)
         {
            _connection.send(new class_316());
         }
      }
      
      public function changeQueue(param1:int) : void
      {
         if(_connection == null)
         {
            return;
         }
         _connection.send(new class_154(param1));
      }
      
      public function sendUpdateClothingChangeFurniture(param1:int, param2:String, param3:String) : void
      {
         if(_connection == null)
         {
            return;
         }
         var _loc4_:* = new class_484(param1,param2,param3);
         _connection.send(_loc4_);
         _loc4_.dispose();
         _loc4_ = null;
      }
      
      public function get userDataManager() : class_3291
      {
         return var_2320 as class_3291;
      }
      
      public function get ownUserRoomId() : int
      {
         return var_3939;
      }
      
      public function set ownUserRoomId(param1:int) : void
      {
         var_3939 = param1;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_2922 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_2922;
      }
      
      public function set roomControllerLevel(param1:int) : void
      {
         if(param1 >= 0 && param1 <= 5)
         {
            var_1362 = param1;
         }
         else
         {
            class_14.log("Invalid roomControllerLevel " + param1 + ", setting to ROOM_CONTROL_LEVEL_NONE instead");
            var_1362 = 0;
         }
      }
      
      public function get roomControllerLevel() : int
      {
         return var_1362;
      }
      
      public function get tradeMode() : int
      {
         return var_776;
      }
      
      public function get isPrivateRoom() : Boolean
      {
         return true;
      }
      
      public function set tradeMode(param1:int) : void
      {
         var_776 = param1;
      }
      
      public function get isGuildRoom() : Boolean
      {
         return _isGuildRoom;
      }
      
      public function set isGuildRoom(param1:Boolean) : void
      {
         _isGuildRoom = param1;
      }
      
      public function get isNoobRoom() : Boolean
      {
         return var_719 == 4;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_719 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_3325;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_3325 = param1;
      }
      
      public function get arePetsAllowed() : Boolean
      {
         return var_4213;
      }
      
      public function set arePetsAllowed(param1:Boolean) : void
      {
         var_4213 = param1;
      }
      
      public function get areBotsAllowed() : Boolean
      {
         return var_2922;
      }
      
      public function get isUserDecorating() : Boolean
      {
         return var_3755;
      }
      
      public function set isUserDecorating(param1:Boolean) : void
      {
         var_3755 = param1;
      }
      
      public function get isNuxNotComplete() : Boolean
      {
         return var_4256;
      }
      
      public function set isNuxNotComplete(param1:Boolean) : void
      {
         var_4256 = param1;
      }
   }
}
