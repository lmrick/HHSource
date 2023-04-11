package package_23
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_894 implements IMessageComposer
   {
       
      
      private var var_953:int;
      
      public function class_894(param1:int)
      {
         super();
         var_953 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_953];
      }
      
      public function dispose() : void
      {
      }
   }
}
