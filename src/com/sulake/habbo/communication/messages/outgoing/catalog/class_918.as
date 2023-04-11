package package_23
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_918 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_918(param1:int, param2:int, param3:String)
      {
         super();
         var_45 = [param1,param2,param3];
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
