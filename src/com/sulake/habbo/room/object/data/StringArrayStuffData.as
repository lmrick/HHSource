package com.sulake.habbo.room.object.data
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.IRoomObjectModelController;
   
   public class StringArrayStuffData extends class_1609 implements IStuffData
   {
      
      public static const FORMAT_KEY:int = 2;
      
      private static const STATE_DEFAULT_INDEX:int = 0;
       
      
      private var var_45:Array;
      
      public function StringArrayStuffData()
      {
         var_45 = [];
         super();
      }
      
      override public function initializeFromIncomingMessage(param1:IMessageDataWrapper) : void
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var_45 = [];
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_45.push(_loc4_);
            _loc3_++;
         }
         super.initializeFromIncomingMessage(param1);
      }
      
      override public function initializeFromRoomObjectModel(param1:IRoomObjectModel) : void
      {
         super.initializeFromRoomObjectModel(param1);
         var_45 = param1.getStringArray("furniture_data");
      }
      
      override public function writeRoomObjectModel(param1:IRoomObjectModelController) : void
      {
         super.writeRoomObjectModel(param1);
         param1.setNumber("furniture_data_format",2);
         param1.setStringArray("furniture_data",var_45);
      }
      
      override public function getLegacyString() : String
      {
         if(!var_45)
         {
            return "";
         }
         return var_45[0];
      }
      
      public function getValue(param1:int) : String
      {
         if(var_45 && param1 < var_45.length)
         {
            return var_45[param1];
         }
         return "";
      }
      
      public function setArray(param1:Array) : void
      {
         var_45 = param1;
      }
      
      override public function compare(param1:IStuffData) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:StringArrayStuffData = param1 as StringArrayStuffData;
         if(!_loc2_)
         {
            return false;
         }
         _loc3_ = 0;
         while(_loc3_ < var_45.length)
         {
            if(_loc3_ != 0)
            {
               if(var_45[_loc3_] != _loc2_.getValue(_loc3_))
               {
                  return false;
               }
            }
            _loc3_++;
         }
         return true;
      }
   }
}
