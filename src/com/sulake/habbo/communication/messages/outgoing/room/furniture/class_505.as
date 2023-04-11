package package_21
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_505 implements IMessageComposer
   {
       
      
      private var var_399:int;
      
      private var _location:String;
      
      private var var_357:String;
      
      private var var_962:String;
      
      public function class_505(param1:int, param2:String, param3:String, param4:String)
      {
         super();
         var_399 = param1;
         _location = param2;
         var_357 = param4;
         var_962 = param3;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_399,_location,var_962,var_357];
      }
   }
}
