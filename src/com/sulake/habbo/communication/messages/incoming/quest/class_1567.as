package package_83
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_1567 implements class_13
   {
       
      
      private var var_822:String;
      
      private var var_213:Array;
      
      public function class_1567(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         var_213 = [];
         super();
         var_822 = param1.readString();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_213.push(new class_1659(param1));
            _loc3_++;
         }
      }
      
      public function dispose() : void
      {
         var_213 = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_213 == null;
      }
      
      public function get hof() : Array
      {
         return var_213;
      }
      
      public function get goalCode() : String
      {
         return var_822;
      }
   }
}
