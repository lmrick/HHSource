package package_96
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_852 implements IMessageComposer
   {
       
      
      private var var_341:int;
      
      private var var_763:int;
      
      private var var_1229:String;
      
      public function class_852(param1:int, param2:int, param3:String)
      {
         super();
         var_341 = param1;
         var_763 = param2;
         var_1229 = param3;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_341,var_763,var_1229];
      }
   }
}
