package package_2
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;

   public class EditEventMessageComposer implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function EditEventMessageComposer(param1:int, param2:String, param3:String)
      {
         var_20 = [];
         super();
         this.var_20.push(param1);
         this.var_20.push(param2);
         this.var_20.push(param3);
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
