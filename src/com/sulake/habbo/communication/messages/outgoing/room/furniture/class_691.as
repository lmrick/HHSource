package package_21
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_691 implements IMessageComposer
   {
       
      
      private var var_399:int;
      
      private var _location:String;
      
      public function class_691(param1:int, param2:String)
      {
         super();
         var_399 = param1;
         _location = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_399,_location];
      }
   }
}
