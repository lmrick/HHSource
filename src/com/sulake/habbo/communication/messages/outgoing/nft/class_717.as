package package_77
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class class_717 implements IMessageComposer
   {
       
      
      private var var_20:Array;
      
      public function class_717()
      {
         var_20 = [];
         super();
      }
      
      public function GetUserNftWardrobeMessageComposer() : *
      {
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
