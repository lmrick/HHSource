package com.sulake.core.communication.wireformat
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.encryption.IEncryption;
   import com.sulake.core.communication.util.Byte;
   import com.sulake.core.communication.util.Short;
   import flash.utils.ByteArray;

   public final class EvaWireFormat implements class_3329
   {
      
      private static const MAX_DATA:uint = 262144;
       
      
      public function EvaWireFormat()
      {
         super();
      }
      
      public function dispose() : void
      {
      }
      
      public function encode(param1:int, param2:Array) : ByteArray
      {
         var _loc4_:ByteArray = null;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeInt(0);
         _loc3_.writeShort(param1);
         for each(var _loc5_ in param2)
         {
            if(_loc5_ is String)
            {
               _loc3_.writeUTF(_loc5_ as String);
            }
            else if(_loc5_ is int)
            {
               _loc3_.writeInt(_loc5_ as int);
            }
            else if(_loc5_ is Boolean)
            {
               _loc3_.writeBoolean(_loc5_ as Boolean);
            }
            else if(_loc5_ is Short)
            {
               _loc3_.writeShort((_loc5_ as Short).value);
            }
            else if(_loc5_ is Byte)
            {
               _loc3_.writeByte((_loc5_ as Byte).value);
            }
            else if(_loc5_ is ByteArray)
            {
               _loc4_ = _loc5_ as ByteArray;
               _loc3_.writeInt(_loc4_.length);
               _loc3_.writeBytes(_loc4_);
            }
         }
         var _loc6_:uint = _loc3_.length;
         _loc3_.position = 0;
         _loc3_.writeInt(_loc6_ - 4);
         _loc3_.position = _loc6_;
         return _loc3_;
      }
      
      public function splitMessages(param1:ByteArray, param2:IConnection) : Array
      {
         var _loc4_:* = 0;
         var _loc3_:* = 0;
         var _loc7_:IEncryption = null;
         var _loc10_:ByteArray = null;
         var _loc9_:ByteArray = null;
         var _loc5_:ByteArray = null;
         var _loc8_:int = 0;
         var _loc6_:* = [];
         while(param1.bytesAvailable >= 6)
         {
            _loc4_ = param1.position;
            _loc3_ = 0;
            if((_loc7_ = param2.getServerToClientEncryption()) != null)
            {
               _loc7_.mark();
               _loc10_ = new ByteArray();
               param1.readBytes(_loc10_,0,4);
               _loc7_.decipher(_loc10_);
               _loc3_ = uint(_loc10_.readInt());
            }
            else
            {
               _loc3_ = uint(param1.readInt());
            }
            if(_loc3_ < 2 || _loc3_ > 262144)
            {
               throw new Error("Invalid message length " + _loc3_);
            }
            if(param1.bytesAvailable < _loc3_)
            {
               param1.position = _loc4_;
               if(_loc7_ != null)
               {
                  _loc7_.reset();
               }
               return _loc6_;
            }
            _loc9_ = new ByteArray();
            if(_loc7_ != null)
            {
               (_loc5_ = new ByteArray()).writeBytes(param1,param1.position,_loc3_);
               _loc7_.decipher(_loc5_);
               _loc9_.writeBytes(_loc5_,0,_loc3_);
               _loc9_.position = 0;
            }
            else
            {
               _loc9_.writeBytes(param1,param1.position,_loc3_);
               _loc9_.position = 0;
            }
            param1.position += _loc3_;
            _loc8_ = _loc9_.readShort();
            _loc6_.push(new class_3412(_loc8_,_loc9_));
         }
         return _loc6_;
      }
   }
}
