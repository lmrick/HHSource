package package_80
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class class_320 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_320(param1:String)
      {
         var_45 = [];
         super();
         var_45.push(param1);
      }
      
      public function getMessageArray() : Array
      {
         return var_45;
      }
      
      public function dispose() : void
      {
         var_45 = null;
      }
   }
}
