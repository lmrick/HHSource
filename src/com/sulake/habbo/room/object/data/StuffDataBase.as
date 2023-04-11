package com.sulake.habbo.room.object.data
{
   import adobe.serialization.json.JSONDecoder;
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.IRoomObjectModelController;
   
   public class StuffDataBase implements IStuffData
   {
       
      
      private var var_423:int;
      
      private var _uniqueSerialNumber:int = 0;
      
      private var var_153:int = 0;
      
      public function StuffDataBase()
      {
         super();
      }
      
      public function set flags(param1:int) : void
      {
         var_423 = param1;
      }
      
      public function initializeFromIncomingMessage(param1:IMessageDataWrapper) : void
      {
         if((var_423 & 256) > 0)
         {
            _uniqueSerialNumber = param1.readInteger();
            var_153 = param1.readInteger();
         }
      }
      
      public function initializeFromRoomObjectModel(param1:IRoomObjectModel) : void
      {
         _uniqueSerialNumber = param1.getNumber("furniture_unique_serial_number");
         var_153 = param1.getNumber("furniture_unique_edition_size");
      }
      
      public function writeRoomObjectModel(param1:IRoomObjectModelController) : void
      {
         param1.setNumber("furniture_unique_serial_number",_uniqueSerialNumber);
         param1.setNumber("furniture_unique_edition_size",var_153);
      }
      
      public function get uniqueSerialNumber() : int
      {
         return _uniqueSerialNumber;
      }
      
      public function get uniqueSeriesSize() : int
      {
         return var_153;
      }
      
      public function set uniqueSerialNumber(param1:int) : void
      {
         _uniqueSerialNumber = param1;
      }
      
      public function set uniqueSeriesSize(param1:int) : void
      {
         var_153 = param1;
      }
      
      public function getLegacyString() : String
      {
         return "";
      }
      
      public function compare(param1:IStuffData) : Boolean
      {
         return false;
      }
      
      public function get rarityLevel() : int
      {
         return -1;
      }
      
      public function get state() : int
      {
         var _loc1_:Number = Number(getLegacyString());
         return isNaN(_loc1_) ? -1 : int(_loc1_);
      }
      
      public function getJSONValue(param1:String) : String
      {
         var _loc2_:* = null;
         try
         {
            return String(new JSONDecoder(getLegacyString(),true).getValue()[param1]);
         }
         catch(error:Error)
         {
            return "";
         }
      }
   }
}
