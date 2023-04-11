package package_132
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1488 implements IMessageParser
   {
       
      
      private var var_853:int;
      
      private var var_663:Array;
      
      public function class_1488()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_663 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         this.var_853 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_663.push(param1.readInteger());
            _loc3_++;
         }
         return true;
      }
      
      public function get limit() : int
      {
         return var_853;
      }
      
      public function get favouriteRoomIds() : Array
      {
         return var_663;
      }
   }
}
