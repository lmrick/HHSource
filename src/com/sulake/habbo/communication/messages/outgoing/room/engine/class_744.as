package package_13
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_744 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_744(param1:int, param2:int, param3:String)
      {
         var_45 = [];
         super();
         var_45.push(param1);
         var_45.push(param3);
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
