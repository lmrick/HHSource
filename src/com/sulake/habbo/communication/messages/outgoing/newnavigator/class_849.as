package package_37
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_849 implements IMessageComposer
   {
       
      
      private var var_205:Array;
      
      public function class_849(param1:String, param2:String)
      {
         var_205 = [];
         super();
         var_205.push(param1);
         var_205.push(param2);
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
