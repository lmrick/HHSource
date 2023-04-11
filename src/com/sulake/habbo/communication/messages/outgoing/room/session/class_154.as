package package_22
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_154 implements IMessageComposer
   {
       
      
      private var var_852:int;
      
      public function class_154(param1:int)
      {
         super();
         var_852 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_852];
      }
      
      public function dispose() : void
      {
      }
      
      public function get disposed() : Boolean
      {
         return true;
      }
   }
}
