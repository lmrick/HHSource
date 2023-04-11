package package_21
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_745 implements IMessageComposer
   {
       
      
      private var _presetNumber:int;
      
      private var var_1221:int;
      
      private var var_1161:String;
      
      private var var_694:int;
      
      private var var_782:Boolean;
      
      public function class_745(param1:int, param2:int, param3:String, param4:int, param5:Boolean)
      {
         super();
         _presetNumber = param1;
         var_1221 = param2;
         var_1161 = param3;
         var_694 = param4;
         var_782 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [_presetNumber,var_1221,var_1161,var_694,var_782];
      }
      
      public function dispose() : void
      {
      }
   }
}
