package package_30
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_646 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_646(param1:int, param2:int = 0)
      {
         var_45 = [];
         super();
         var_45.push(param1);
         var_45.push(param2);
      }
      
      public function getMessageArray() : Array
      {
         return var_45;
      }
      
      public function dispose() : void
      {
         var_45 = [];
      }
   }
}
