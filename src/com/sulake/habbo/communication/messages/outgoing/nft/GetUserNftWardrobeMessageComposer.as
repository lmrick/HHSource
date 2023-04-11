package package_77
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class GetUserNftWardrobeMessageComposer implements IMessageComposer
   {
       
      
      private var var_20:Array;
      
      public function GetUserNftWardrobeMessageComposer()
      {
         var_20 = [];
         super();
      }
      
      public function getMessageArray() : Array
      {
         return var_20;
      }
      
      public function dispose() : void
      {
         this.var_20 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
