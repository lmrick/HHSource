package package_13
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_211 implements IMessageComposer
   {
       
      
      private var var_347:int;
      
      private var var_907:int;
      
      public function class_211(param1:int, param2:int)
      {
         super();
         var_347 = param1;
         var_907 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:int = 0;
         switch(var_907 - 10)
         {
            case 0:
               _loc1_ = 2;
               break;
            case 10:
               _loc1_ = 1;
               break;
            default:
               return [];
         }
         return [_loc1_,var_347];
      }
   }
}
