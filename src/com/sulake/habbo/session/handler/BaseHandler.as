package com.sulake.habbo.session.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.session.IRoomHandlerListener;
   
   public class BaseHandler implements class_13
   {
       
      
      private var _connection:IConnection;
      
      private var var_79:IRoomHandlerListener;
      
      private var _disposed:Boolean = false;
      
      public var var_1459:int;
      
      public function BaseHandler(param1:IConnection, param2:IRoomHandlerListener)
      {
         super();
         _connection = param1;
         var_79 = param2;
      }
      
      public function dispose() : void
      {
         _connection = null;
         var_79 = null;
         _disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get connection() : IConnection
      {
         return _connection;
      }
      
      public function get listener() : IRoomHandlerListener
      {
         return var_79;
      }
   }
}
