package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1466 implements IMessageParser
   {
       
      
      private var var_595:int;
      
      private var var_927:int;
      
      private var var_1164:int;
      
      private var var_410:int;
      
      public function class_1466()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_595 = param1.readInteger();
         var_927 = param1.readInteger();
         var_1164 = param1.readInteger();
         if(param1.bytesAvailable)
         {
            var_410 = param1.readInteger();
         }
         else
         {
            var_410 = var_595;
         }
         return true;
      }
      
      public function get secondsLeft() : int
      {
         return var_595;
      }
      
      public function get furniLimit() : int
      {
         return var_927;
      }
      
      public function get maxFurniLimit() : int
      {
         return var_1164;
      }
      
      public function get secondsLeftWithGrace() : int
      {
         return var_410;
      }
   }
}
