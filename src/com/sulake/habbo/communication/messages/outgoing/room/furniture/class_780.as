package package_21
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_780 implements IMessageComposer
   {
       
      
      private var var_490:int;
      
      private var var_829:int;
      
      private var _saturation:int;
      
      private var var_1054:int;
      
      public function class_780(param1:int, param2:int, param3:int, param4:int)
      {
         super();
         var_490 = param1;
         var_829 = param2;
         _saturation = param3;
         var_1054 = param4;
      }
      
      public function getMessageArray() : Array
      {
         return [var_490,var_829,_saturation,var_1054];
      }
      
      public function dispose() : void
      {
      }
   }
}
