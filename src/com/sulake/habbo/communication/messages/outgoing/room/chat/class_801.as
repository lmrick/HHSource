package package_111
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_801 implements IMessageComposer
   {
       
      
      private var _text:String;
      
      private var _recipientName:String;
      
      private var var_696:int = 0;
      
      public function class_801(param1:String, param2:String, param3:int = 0)
      {
         super();
         _recipientName = param1;
         _text = param2;
         var_696 = param3;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [_recipientName + " " + _text,var_696];
      }
   }
}
