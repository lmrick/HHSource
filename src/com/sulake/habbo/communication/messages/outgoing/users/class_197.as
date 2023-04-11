package package_7
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_197 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_197(param1:int, param2:Boolean)
      {
         var_45 = [];
         super();
         var_45.push(param1);
         var_45.push(param2);
      }
      
      public function dispose() : void
      {
         var_45 = null;
      }
      
      public function getMessageArray() : Array
      {
         return var_45;
      }
   }
}
