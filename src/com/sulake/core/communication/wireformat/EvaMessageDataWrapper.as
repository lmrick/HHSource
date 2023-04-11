package com.sulake.core.communication.wireformat
{
   import com.hurlant.util.class_23;
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import flash.utils.ByteArray;
   
   internal final class EvaMessageDataWrapper implements IMessageDataWrapper
   {
       
      
      private var var_247:int;
      
      private var var_45:ByteArray;
      
      public function EvaMessageDataWrapper(param1:int, param2:ByteArray)
      {
         super();
         var_247 = param1;
         var_45 = param2;
      }
      
      public function getID() : int
      {
         return var_247;
      }
      
      public function readString() : String
      {
         return var_45.readUTF();
      }
      
      public function readInteger() : int
      {
         return var_45.readInt();
      }
      
      public function readBoolean() : Boolean
      {
         return var_45.readBoolean();
      }
      
      public function readShort() : int
      {
         return var_45.readShort();
      }
      
      public function readByte() : int
      {
         return var_45.readByte();
      }
      
      public function readFloat() : Number
      {
         return var_45.readFloat();
      }
      
      public function readDouble() : Number
      {
         return var_45.readDouble();
      }
      
      public function get bytesAvailable() : uint
      {
         return var_45.bytesAvailable;
      }
      
      public function toString() : String
      {
         return "id=" + var_247 + ", pos=" + var_45.position + ", data=" + class_23.fromArray(var_45,true);
      }
   }
}
