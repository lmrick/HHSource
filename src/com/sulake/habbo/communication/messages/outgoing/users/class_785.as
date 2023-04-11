package package_7
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_785 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_785(param1:int, param2:Array)
      {
         var _loc3_:int = 0;
         var_45 = [];
         super();
         var_45.push(param1);
         var_45.push(param2.length);
         _loc3_ = 0;
         while(_loc3_ < param2.length)
         {
            var_45.push(int(param2[_loc3_]));
            _loc3_++;
         }
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
