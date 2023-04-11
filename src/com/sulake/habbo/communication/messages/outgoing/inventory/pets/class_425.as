package package_98
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_425 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_425(param1:int, param2:String, param3:int, param4:int)
      {
         var_45 = [];
         super();
         var_45.push(param1);
         var_45.push(param2);
         var_45.push(param3);
         var_45.push(param4);
      }
      
      public function getMessageArray() : Array
      {
         return var_45;
      }
      
      public function dispose() : void
      {
         var_45 = null;
      }
   }
}
