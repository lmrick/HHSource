package package_2
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;

   public class GuildBaseSearchMessageComposer implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function GuildBaseSearchMessageComposer(param1:int)
      {
         var_20 = [];
         super();
         this.var_20.push(param1);
      }
      
      public function getMessageArray() : Array
      {
         return this.var_20;
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
