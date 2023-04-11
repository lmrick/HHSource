package package_23
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_832 implements IMessageComposer
   {
       
      
      private var _offerId:int;
      
      public function class_832(param1:int)
      {
         super();
         _offerId = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [_offerId];
      }
      
      public function dispose() : void
      {
      }
   }
}
