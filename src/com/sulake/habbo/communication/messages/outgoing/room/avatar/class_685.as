package package_34
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_685 implements IMessageComposer
   {
       
      
      private var _style:int;
      
      public function class_685(param1:int)
      {
         super();
         _style = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [_style];
      }
   }
}
