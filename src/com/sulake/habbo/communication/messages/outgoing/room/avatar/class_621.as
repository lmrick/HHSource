package package_34
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_621 implements IMessageComposer
   {
       
      
      private var var_831:int;
      
      private var var_745:int;
      
      public function class_621(param1:int, param2:int)
      {
         super();
         var_831 = param1;
         var_745 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [var_831,var_745];
      }
      
      public function dispose() : void
      {
      }
   }
}
