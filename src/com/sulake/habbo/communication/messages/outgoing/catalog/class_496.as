package package_23
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_496 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_496(param1:String)
      {
         super();
         var_45 = [param1];
      }
      
      public function dispose() : void
      {
         var_45 = null;
      }
      
      public function getMessageArray() : Array
      {
         return var_45;
      }
   }
}
