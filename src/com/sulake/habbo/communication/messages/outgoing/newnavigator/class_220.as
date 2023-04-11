package package_37
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_220 implements IMessageComposer
   {
       
      
      private var var_205:Array;
      
      public function class_220(param1:int)
      {
         var_205 = [];
         super();
         var_205.push(param1);
      }
      
      public function getMessageArray() : Array
      {
         return var_205;
      }
      
      public function dispose() : void
      {
         var_205 = null;
      }
   }
}
