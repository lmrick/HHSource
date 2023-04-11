package package_13
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_484 implements IMessageComposer
   {
       
      
      private var var_347:int;
      
      private var var_122:String;
      
      private var var_1057:String;
      
      public function class_484(param1:int, param2:String, param3:String = "")
      {
         super();
         var_347 = param1;
         var_122 = param2;
         var_1057 = param3;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_347,var_122,var_1057];
      }
   }
}
