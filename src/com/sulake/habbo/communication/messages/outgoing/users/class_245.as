package package_7
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_245 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_245(param1:String, param2:String, param3:int, param4:int, param5:int, param6:Array)
      {
         var _loc7_:int = 0;
         var_45 = [];
         super();
         var_45.push(param1);
         var_45.push(param2);
         var_45.push(param3);
         var_45.push(param4);
         var_45.push(param5);
         var_45.push(param6.length);
         _loc7_ = 0;
         while(_loc7_ < param6.length)
         {
            var_45.push(int(param6[_loc7_]));
            _loc7_++;
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
