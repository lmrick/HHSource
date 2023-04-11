package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_144.class_1572;
   
   [SecureSWF(rename="true")]
   public class class_1162 implements IMessageParser
   {
      
      public static const const_33:int = 16;
       
      
      private var var_1012:int;
      
      private var var_1261:int;
      
      private var var_296:class_1572;
      
      public function class_1162()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_296 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1012 = param1.readInteger();
         var_1261 = param1.readInteger();
         var_296 = new class_1572(param1);
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1261;
      }
      
      public function get respect() : int
      {
         return var_1012;
      }
      
      public function get petData() : class_1572
      {
         return var_296;
      }
      
      public function isTreat() : Boolean
      {
         return false;
      }
   }
}
