package package_111
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_772 implements IMessageComposer
   {
       
      
      private var _text:String;
      
      private var var_696:int = 0;
      
      public function class_772(param1:String, param2:int = 0)
      {
         super();
         _text = param1;
         var_696 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [_text,var_696];
      }
   }
}
