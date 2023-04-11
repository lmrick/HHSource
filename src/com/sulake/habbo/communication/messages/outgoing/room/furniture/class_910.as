package package_21
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_910 implements IMessageComposer
   {
       
      
      private var var_490:int;
      
      private var _name:String;
      
      public function class_910(param1:int, param2:String)
      {
         super();
         var_490 = param1;
         _name = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [var_490,_name];
      }
      
      public function dispose() : void
      {
      }
   }
}
