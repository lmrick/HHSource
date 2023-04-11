package package_37
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_967 implements IMessageComposer
   {
       
      
      private var var_205:Array;
      
      public function class_967(param1:String, param2:int)
      {
         var_205 = [];
         super();
         var_205 = [param1,param2];
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
