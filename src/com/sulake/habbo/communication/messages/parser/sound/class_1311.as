package package_146
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_93.class_1544;
   
   [SecureSWF(rename="true")]
   public class class_1311 implements IMessageParser
   {
       
      
      private var var_478:class_1544;
      
      public function class_1311()
      {
         super();
      }
      
      public function get entry() : class_1544
      {
         return var_478;
      }
      
      public function flush() : Boolean
      {
         var_478 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc5_:int = param1.readInteger();
         var _loc4_:int = param1.readInteger();
         var _loc2_:String = param1.readString();
         var _loc3_:String = param1.readString();
         var_478 = new class_1544(_loc5_,_loc4_,_loc2_,_loc3_);
         return true;
      }
   }
}
