package com.sulake.habbo.room.object.data
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.room.*;
   import com.sulake.habbo.room.object.*;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.IRoomObjectModelController;
   
   public class MapStuffData extends class_1609 implements IStuffData
   {
      
      public static const FORMAT_KEY:int = 1;
      
      private static const STATE_DEFAULT_KEY:String = "state";
      
      private static const const_326:String = "rarity";
       
      
      private var var_45:class_24;
      
      public function MapStuffData(param1:class_24 = null)
      {
         super();
         if(param1)
         {
            var_45 = param1;
         }
      }
      
      override public function initializeFromIncomingMessage(param1:IMessageDataWrapper) : void
      {
         var _loc3_:int = 0;
         var _loc5_:String = null;
         var _loc4_:String = null;
         var_45 = new class_24();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = param1.readString();
            _loc4_ = param1.readString();
            var_45.add(_loc5_,_loc4_);
            _loc3_++;
         }
         super.initializeFromIncomingMessage(param1);
      }
      
      override public function initializeFromRoomObjectModel(param1:IRoomObjectModel) : void
      {
         super.initializeFromRoomObjectModel(param1);
         var_45 = param1.getStringToStringMap("furniture_data");
      }
      
      override public function writeRoomObjectModel(param1:IRoomObjectModelController) : void
      {
         super.writeRoomObjectModel(param1);
         param1.setNumber("furniture_data_format",1);
         param1.setStringToStringMap("furniture_data",var_45);
      }
      
      override public function getLegacyString() : String
      {
         if(var_45 && var_45.getValue("state") != null)
         {
            return var_45["state"];
         }
         return "";
      }
      
      public function getValue(param1:String) : String
      {
         return var_45[param1];
      }
      
      override public function compare(param1:IStuffData) : Boolean
      {
         return false;
      }
      
      override public function get rarityLevel() : int
      {
         var _loc1_:String = "null";
         if(_loc1_)
         {
            return int(_loc1_);
         }
         return -1;
      }
   }
}
