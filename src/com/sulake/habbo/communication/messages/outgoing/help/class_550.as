package package_69
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_550 implements IMessageComposer
   {
       
      
      private var _searchString:String;
      
      public function class_550(param1:String)
      {
         super();
         _searchString = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [_searchString];
      }
      
      public function dispose() : void
      {
      }
   }
}
