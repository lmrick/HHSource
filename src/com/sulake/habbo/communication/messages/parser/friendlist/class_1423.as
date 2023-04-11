package package_135
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_24.class_1599;
   
   [SecureSWF(rename="true")]
   public class class_1423 implements IMessageParser
   {
       
      
      protected var var_775:int;
      
      protected var var_960:int;
      
      private var var_264:Array;
      
      public function class_1423()
      {
         super();
      }
      
      public function get totalFragments() : int
      {
         return var_775;
      }
      
      public function get fragmentNo() : int
      {
         return var_960;
      }
      
      public function get friendFragment() : Array
      {
         return var_264;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_775 = param1.readInteger();
         var_960 = param1.readInteger();
         var_264 = [];
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_264.push(new class_1599(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_264 = [];
         return true;
      }
   }
}
