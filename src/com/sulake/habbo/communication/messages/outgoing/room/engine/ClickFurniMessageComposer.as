package package_13
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class ClickFurniMessageComposer implements IMessageComposer
   {
       
      
      private var var_347:int;
      
      private var var_271:int = 0;
      
      public function ClickFurniMessageComposer(param1:int, param2:int = 0)
      {
         super();
         var_347 = param1;
         var_271 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_347,var_271];
      }
   }
}
