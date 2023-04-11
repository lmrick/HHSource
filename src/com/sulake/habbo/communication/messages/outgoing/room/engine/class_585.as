package package_13
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_585 implements IMessageComposer
   {
       
      
      private var var_347:int;
      
      private var var_29:int;
      
      private var var_28:int;
      
      private var _direction:int;
      
      public function class_585(param1:int, param2:int, param3:int, param4:int)
      {
         super();
         var_347 = param1;
         var_29 = param2;
         var_28 = param3;
         _direction = param4;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_347,var_29,var_28,_direction];
      }
   }
}
