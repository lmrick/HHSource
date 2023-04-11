package com.sulake.core.communication.messages
{
   import com.sulake.core.communication.connection.IConnection;
   
   public class MessageEvent implements IMessageEvent
   {
       
      
      protected var _callback:Function;
      
      protected var _connection:IConnection;
      
      private var var_527:Class;
      
      protected var var_15:com.sulake.core.communication.messages.IMessageParser;
      
      public function MessageEvent(param1:Function, param2:Class)
      {
         super();
         _callback = param1;
         var_527 = param2;
      }
      
      public function dispose() : void
      {
         _callback = null;
         var_527 = null;
         _connection = null;
         var_15 = null;
      }
      
      public function get callback() : Function
      {
         return _callback;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get connection() : IConnection
      {
         return _connection;
      }
      
      public function get parserClass() : Class
      {
         return var_527;
      }
      
      public function get parser() : com.sulake.core.communication.messages.IMessageParser
      {
         return var_15;
      }
      
      public function set parser(param1:com.sulake.core.communication.messages.IMessageParser) : void
      {
         var_15 = param1;
      }
   }
}
