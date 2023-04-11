package package_50
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_1655 implements class_13
   {
       
      
      private var var_718:Boolean;
      
      private var _name:String;
      
      private var _desc:String;
      
      private var var_239:Array;
      
      private var _disposed:Boolean;
      
      public function class_1655(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         var_239 = [];
         super();
         var_718 = param1.readBoolean();
         if(!exists)
         {
            return;
         }
         _name = param1.readString();
         _desc = param1.readString();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_239.push(param1.readString());
            _loc3_++;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_239 = null;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get desc() : String
      {
         return _desc;
      }
      
      public function get tags() : Array
      {
         return var_239;
      }
      
      public function get exists() : Boolean
      {
         return var_718;
      }
   }
}
