package com.sulake.core.communication.wireformat
{
   import com.sulake.core.communication.connection.IConnection;
   import flash.utils.ByteArray;
   
   public interface IWireFormat
   {
      
      function dispose() : void;
      
      function encode(param1:int, param2:Array) : ByteArray;
      
      function splitMessages(param1:ByteArray, param2:IConnection) : Array;
   }
}
