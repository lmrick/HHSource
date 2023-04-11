package package_69
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_269 implements IMessageComposer
   {
       
      
      private var var_1199:Boolean;
      
      public function class_269(param1:Boolean)
      {
         super();
         var_1199 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1199];
      }
      
      public function dispose() : void
      {
      }
   }
}
