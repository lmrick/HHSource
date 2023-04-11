package package_7
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_296 implements IMessageComposer
   {
       
      
      private var _name:String;
      
      private var var_271:int;
      
      public function class_296(param1:String, param2:int)
      {
         super();
         _name = param1;
         var_271 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [_name,var_271];
      }
      
      public function dispose() : void
      {
      }
   }
}
