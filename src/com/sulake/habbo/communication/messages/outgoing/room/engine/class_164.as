package package_13
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_164 implements IMessageComposer
   {
       
      
      private var var_347:int;
      
      private var var_45:String;
      
      private var var_962:String;
      
      public function class_164(param1:int, param2:String = "", param3:String = "")
      {
         super();
         var_347 = param1;
         var_45 = param3;
         var_962 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_347,var_962,var_45];
      }
   }
}
