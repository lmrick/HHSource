package package_1
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import flash.utils.getTimer;

   public class class_884 implements IMessageComposer
   {
       
      
      private var var_357:Array;
      
      public function class_884(param1:String)
      {
         super();
         var_357 = [];
         var_357.push(param1);
         var_357.push(getTimer());
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_357;
      }
   }
}
