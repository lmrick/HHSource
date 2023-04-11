package com.sulake.habbo.room.object.data
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.IRoomObjectModelController;
   
   public class VoteResultStuffData extends class_1609 implements IStuffData
   {
      
      public static const FORMAT_KEY:int = 3;
      
      private static const INTERNAL_STATE_KEY:String = "s";
      
      private static const INTERNAL_RESULT_KEY:String = "r";
       
      
      private var var_159:String = "";
      
      private var var_170:int;
      
      public function VoteResultStuffData()
      {
         super();
      }
      
      override public function initializeFromIncomingMessage(param1:IMessageDataWrapper) : void
      {
         var_159 = param1.readString();
         var_170 = param1.readInteger();
         super.initializeFromIncomingMessage(param1);
      }
      
      override public function writeRoomObjectModel(param1:IRoomObjectModelController) : void
      {
         super.writeRoomObjectModel(param1);
         param1.setNumber("furniture_data_format",3);
         var _loc2_:class_24 = new class_24();
         _loc2_.add("s",var_159);
         _loc2_.add("r",var_170.toString());
         param1.setStringToStringMap("furniture_data",_loc2_);
      }
      
      override public function initializeFromRoomObjectModel(param1:IRoomObjectModel) : void
      {
         super.initializeFromRoomObjectModel(param1);
         var _loc2_:class_24 = param1.getStringToStringMap("furniture_data");
         var_159 = _loc2_.getValue("s");
         var_170 = _loc2_.getValue("r");
      }
      
      override public function getLegacyString() : String
      {
         return var_159;
      }
      
      public function setString(param1:String) : void
      {
         var_159 = param1;
      }
      
      public function get result() : int
      {
         return var_170;
      }
      
      override public function compare(param1:IStuffData) : Boolean
      {
         return true;
      }
   }
}
