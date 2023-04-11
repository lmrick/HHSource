package package_13
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_627 implements IMessageComposer
   {
       
      
      private var var_347:int;
      
      private var var_907:int;
      
      private var _wallLocation:String;
      
      private var var_29:int = 0;
      
      private var var_28:int = 0;
      
      private var var_386:int = 0;
      
      public function class_627(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int)
      {
         super();
         var_347 = param1;
         var_907 = param2;
         _wallLocation = param3;
         var_29 = param4;
         var_28 = param5;
         var_386 = param6;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         switch(var_907 - 10)
         {
            case 0:
               return [var_347 + " " + var_29 + " " + var_28 + " " + var_386];
            case 10:
               return [var_347 + " " + _wallLocation];
            default:
               return [];
         }
      }
   }
}
